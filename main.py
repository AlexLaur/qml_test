import sys
import os

from PySide2 import QtGui, QtCore, QtWidgets, QtQml

SCRIPT_PATH = os.path.dirname(__file__)


class MainWindowEngine(QtQml.QQmlApplicationEngine):
    def __init__(self, qml_path=None):
        super(MainWindowEngine, self).__init__()

        self.load(qml_path)

        self.roots = self.rootObjects()

        self.button = self.roots[0].findChild(QtCore.QObject, 'menu_profile')
        self.button.clicked.connect(self.button_clicked)

    def button_clicked(self):
        sender = self.sender()
        # sender.setProperty('icon.source', 'icons/menu.png')
        print('Clicked')


if __name__ == "__main__":
    app = QtGui.QGuiApplication(sys.argv)
    # app = QtWidgets.QApplication(sys.argv)

    qml_path = os.path.join(SCRIPT_PATH, 'ui', 'main.qml')
    engine = MainWindowEngine(qml_path=qml_path)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
