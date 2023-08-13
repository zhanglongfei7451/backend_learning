
class childs(object):
    def __init__(self, parent):
        self.parent = parent
        print("This is in the child's __init__.")
    def finalize_response(self, name):
        return super(childs, self).finalize_response(name)



if __name__ == "__main__":
    child = childs('110101')
    print("-------------Create childs()-------------------")
    child.finalize_response("I love my parents!")
