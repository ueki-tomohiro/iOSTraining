import UIKit

class ParentObject {
    var object: AnyObject?
    
    deinit {
        print("ParentObject: released")
    }
}

class ChildObject {
    // TODO: 2.objectを弱参照にして、printの出力結果の違いを確かめてみましょう
    var object: AnyObject?
    
    deinit {
        print("ChildObject: released")
    }
}

//ParentObjectのインスタンスへの強参照をparentObjが所持
var parentObj: ParentObject? = ParentObject()

//ChildObjectのインスタンスへの強参照をchildObjが所持
var childObj: ChildObject? = ChildObject()

// TODO: 1.上記2つのオブジェクトのプロパティobjectにお互いを代入して、
// printの結果がどう変わるか確認しましょう
parentObj?.object = childObj
childObj?.object = parentObj

// nilを代入(参照を解放)するとdeinitが実行される
print("---- release parentObj ----")
parentObj = nil

print("---- release childObj ----")
childObj = nil

var weakParentObj: ParentObject? = ParentObject()

//ChildObjectのインスタンスへの弱参照をchildObjが所持
weak var weakChildObj: ChildObject? = ChildObject()

// TODO: 1.上記2つのオブジェクトのプロパティobjectにお互いを代入して、
// printの結果がどう変わるか確認しましょう
weakParentObj?.object = weakChildObj
weakChildObj?.object = weakParentObj

// nilを代入(参照を解放)するとdeinitが実行される
print("---- release weakParentObj ----")
weakParentObj = nil

print("---- release weakChildObj ----")
weakChildObj = nil
