import sys

from PySide.QtGui import *
from BasicUI import *
import re


class Consumer(QMainWindow, Ui_MainWindow):

    states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY",
              "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND",
              "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

    def __init__(self, parent=None):

        super(Consumer, self).__init__(parent)
        self.setupUi(self)

        self.clearButton.clicked.connect(self.Clear)
        self.saveToTargetButton.clicked.connect(self.Save)
        self.loadButton.clicked.connect(self.loadData)

        self.input=[self.firstNameLineEdit,self.lastNameLineEdit,self.cityLineEdit,self.addressLineEdit,self.stateLineEdit,self.zipLineEdit,self.emailLineEdit]

        for single in self.input:
            single.textChanged.connect(self.enable)

    def enable(self):
        for single in self.input:
            if single is not None:
                self.saveToTargetButton.setEnabled(True)
                self.loadButton.setEnabled(False)

    def Clear(self):
        for single in self.input:
            single.clear()
            self.saveToTargetButton.setEnabled(False)
            self.loadButton.setEnabled(True)

    def Save(self):
        self.errorInfoLabel.clear()

        for i in self.input:
            if(i.text() == ''):
                self.errorInfoLabel.setText('Error: All entries must be populated.')
                return

        if self.stateLineEdit.text() not in self.states:
            self.errorInfoLabel.setText('Error: The State must be one of the valid US states.')
            return

        if len(self.zipLineEdit.text()) != 5:
            self.errorInfoLabel.setText('Error: The Zip code must be a 5-digit number.')
            return

        email_form = re.search(r'(\w+@\w+\.\w+)', self.emailLineEdit.text())
        if(email_form is None):
            self.errorInfoLabel.setText('Error: The Email must have a valid email format')
            return

        file_return = open('target.xml', 'w')
        file_return.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        file_return.write('<user>\n')
        file_return.write('\t<FirstName>' + self.firstNameLineEdit.text() + '</FirstName>\n')
        file_return.write('\t<LastName>' + self.lastNameLineEdit.text() + '</LastName>\n')
        file_return.write('\t<Address>' + self.addressLineEdit.text() + '</Address>\n')
        file_return.write('\t<City>' + self.cityLineEdit.text() + '</City>\n')
        file_return.write('\t<State>' + self.stateLineEdit.text() + '</State>\n')
        file_return.write('\t<ZIP>' + self.zipLineEdit.text() + '</ZIP>\n')
        file_return.write('\t<Email>' + self.emailLineEdit.text() + '</Email>\n')
        file_return.write('</user>\n')


    def loadDataFromFile(self, filePath):
        """
        Handles the loading of the data from the given file name. This method will be invoked by the 'loadData' method.

        *** This method is required for unit tests! ***
        """
        with open(filePath, 'r') as filetoopen:
            lines = filetoopen.readlines()
            all_line =[]
            for x in lines:
                all_line.append(x.strip())
            for single in all_line[2:]:
                if 'FirstName' in single:
                    self.firstNameLineEdit.setText(single[11:-12])
                if 'LastName' in single:
                    self.lastNameLineEdit.setText(single[10:-11])
                if 'Address' in single:
                    self.addressLineEdit.setText(single[9:-10])
                if 'City' in single:
                    self.cityLineEdit.setText(single[6:-7])
                if 'State' in single:
                    self.stateLineEdit.setText(single[7:-8])
                if 'ZIP' in single:
                    self.zipLineEdit.setText(single[5:-6])
                if 'Email' in single:
                    self.emailLineEdit.setText(single[7:-8])

    def loadData(self):
        """
        Obtain a file name from a file dialog, and pass it on to the loading method. This is to facilitate automated
        testing. Invoke this method when clicking on the 'load' button.

        *** DO NOT MODIFY THIS METHOD! ***
        """
        filePath, _ = QFileDialog.getOpenFileName(self, caption='Open XML file ...', filter="XML files (*.xml)")

        if not filePath:
            return

        self.loadDataFromFile(filePath)



if __name__ == "__main__":
    currentApp = QApplication(sys.argv)
    currentForm = Consumer()

    currentForm.show()
    currentApp.exec_()
