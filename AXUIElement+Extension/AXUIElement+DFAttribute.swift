//
//  AXUIElement+DFAttribute.swift
//  WindowSnap
//
//  Created by raymond on 2021/1/7.
//

import Foundation
import Cocoa

private let kAXFullscreenAttribute = "AXFullScreen"
extension AXUIElement{
    
    func position() -> CGPoint? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXPositionAttribute,error: &error) as? CGPoint
    }
    
    func setPosition(point:CGPoint) -> AXError {
        return self.set(attributeKey: kAXPositionAttribute, value: point)
    }
    
    func size() -> CGSize? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSizeAttribute,error: &error) as? CGSize
    }
    
    func setSize(size:CGSize) -> AXError {
        return self.set(attributeKey: kAXSizeAttribute, value: size)
    }
    
    func frame() -> CGRect? {
        if let orgin = self.position(),let size = self.size(){
            return CGRect.init(origin: orgin, size: size)
        }
        return nil
    }
    
    func setFrame(rect:CGRect)  {
        _ = setPosition(point: rect.origin)
        _ = setSize(size: rect.size)
    }
    
    func setFrame(origin:CGPoint, size:CGSize)  {
        _ = setPosition(point: origin)
        _ = setSize(size: size)
    }
    
    
    func isMinimized() -> Bool? {
        kAXCloseButtonSubrole
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMinimizedAttribute,error: &error) as? Bool
    }
    
    
    func minimized(_ isMinimized:Bool) -> AXError {
        self.set(attributeKey: kAXMinimizedAttribute, value: isMinimized)
    }
    
    func isFullScreen() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXFullscreenAttribute,error: &error) as? Bool
    }
    
    func fullScreen() -> AXError {
        self.set(attributeKey: kAXFullscreenAttribute, value: kCFBooleanTrue as Any)
    }
    
    func title() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXTitleAttribute,error: &error) as? String
    }
    
    func setTitle(title:String) -> AXError {
        return self.set(attributeKey: kAXTitleAttribute, value: title as CFString)
    }
    
    func role() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRoleAttribute,error: &error) as? String
    }
    
    func subRole() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSubroleAttribute,error: &error) as? String
    }
    
    func roleDescription() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRoleDescriptionAttribute,error: &error) as? String
    }
    
    func help() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHelpAttribute,error: &error) as? String
    }
    
    func valueAttribute() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXValueAttribute,error: &error) as? String
    }
    
    func valueDescriptionAttribute() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXValueDescriptionAttribute,error: &error) as? String
    }
    
    func minValue() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMinValueAttribute,error: &error)
    }
    
    func maxValue() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMaxValueAttribute,error: &error)
    }
    
    func valueIncrement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXValueIncrementAttribute,error: &error)
    }
    
    func allowedValues() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXAllowedValuesAttribute,error: &error)
    }
    
    func placeholderValue() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXPlaceholderValueAttribute,error: &error) as? String
    }
    
    func enabled() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXEnabledAttribute,error: &error) as? Bool
    }
    
    func busy() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXElementBusyAttribute,error: &error) as? Bool
    }
    
    func focused() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXFocusedAttribute,error: &error) as? Bool
    }
    
    func parent() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXParentAttribute,error: &error)
    }
    
    func children() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return  self.value(attributeKey: kAXChildrenAttribute,error: &error) as? [AXUIElement]
    }
    
    func selectedChildren() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return  self.value(attributeKey: kAXSelectedChildrenAttribute,error: &error) as? [AXUIElement]
    }
    
    func visibleChildren() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return  self.value(attributeKey: kAXVisibleChildrenAttribute,error: &error) as? [AXUIElement]
    }
    
    func window() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXWindowAttribute,error: &error)
    }
    
    func topLevelUIElement() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXTopLevelUIElementAttribute,error: &error)
    }
    
    func orientation() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXOrientationAttribute,error: &error) as? String
    }
    
    func descriptionAttributetation() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDescriptionAttribute,error: &error) as? String
    }
    
    func description() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDescription,error: &error) as? String
    }
    
    func selectedText() -> String? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSelectedTextAttribute,error: &error) as? String
    }
    
    func selectedTextRange() -> CFRange? {
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXSelectedTextRangeAttribute,error: &error){
            let axValue : AXValue = value as! AXValue
            return axValue.cfRange()
        }
        return nil
    }
    
    func selectedTextRange() -> [CFRange]? {
        var result = [CFRange]()
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXSelectedTextRangesAttribute,error: &error){
            let axValues = value as! [AXValue]
            for axValue in axValues {
                if let range = axValue.cfRange(){
                    result.append(range)
                }
                
            }
        }
        return result
    }
    
    func visibleCharacterRange() -> CFRange? {
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXVisibleCharacterRangeAttribute,error: &error){
            let axValue : AXValue = value as! AXValue
            return axValue.cfRange()
        }
        return nil
    }
    
    func numberOfCharacters() -> CFNumber? {
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXNumberOfCharactersAttribute,error: &error){
            let cfNumberValue : CFNumber = value as! CFNumber
            return cfNumberValue
        }
        return nil
        
    }
    
    func sharedTextUIElements() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSharedTextUIElementsAttribute,error: &error) as? [AXUIElement]
    }
    
    func sharedCharacterRange() -> CFRange? {
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXSharedCharacterRangeAttribute,error: &error){
            let axValue : AXValue = value as! AXValue
            return axValue.cfRange()
        }
        return nil
    }
    
    func sharedFocusElements() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSharedFocusElementsAttribute,error: &error) as? [AXUIElement]
    }
    
    func insertionPointLineNumber() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXInsertionPointLineNumberAttribute,error: &error)
    }
    
    func isMain() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMainAttribute,error: &error) as? Bool
    }
    
    func closeButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXCloseButtonAttribute,error: &error)
    }
    
    func zoomBotton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXZoomButtonAttribute,error: &error)
    }
    
    func minimizeBotton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMinimizeButtonAttribute,error: &error)
    }
    
    func toolbarButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMinimizeButtonAttribute,error: &error)
    }
    
    func fullScreenButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXFullScreenButtonAttribute,error: &error)
    }
    
    /// A convenience attribute so assistive apps can quickly access a window's document proxy element.
    ///  Writable? No.
    /// - Returns: Value: An AXUIElementRef of the window's document proxy element.
    func proxy() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXProxyAttribute,error: &error)
    }
    
    /// A convenience attribute so assistive apps can quickly access a window's grow area element. Required for all window elements that have a grow area.
    ///  Writable? No.
    /// - Returns: Value: An AXUIElementRef of the window's grow area element.
    func growArea() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXGrowAreaAttribute,error: &error)
    }
    
    /// Whether a window is modal.
    ///  Required for all window elements.
    ///  Writable? No.
    /// - Returns: A Bool. True means the window is modal.
    func isModal() -> Bool? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXModalAttribute,error: &error) as? Bool
    }
    
    ///  A convenience attribute so assistive apps can quickly access a window's default button element, if any.
    ///  Writable? No.
    ///  Required for all window elements that have a default button.
    /// - Returns: Value: An AXUIElementRef of the window's default button element.
    func defaultButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXDefaultButtonAttribute,error: &error)
    }
    
    ///  A convenience attribute so assistive apps can quickly access a window's cancel button element, if any.
    ///  Writable? No.
    ///  Writable? No.
    /// - Returns: Value: An AXUIElementRef of the window's cancel button element.
    func cancelButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXCancelButtonAttribute,error: &error)
    }

    // MARK: menu-specific attributes
    func menuItemCmdChar() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemCmdCharAttribute,error: &error)
    }
    
    func menuItemCmdVirtualKey() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemCmdVirtualKeyAttribute,error: &error)
    }
    
    func menuItemCmdGlyph() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemCmdGlyphAttribute,error: &error)
    }
    
    func menuItemCmdModifiers() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemCmdModifiersAttribute,error: &error)
    }
    
    func menuItemMarkChar() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemMarkCharAttribute,error: &error)
    }
    
    func menuItemPrimaryUIElement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMenuItemPrimaryUIElementAttribute,error: &error)
    }
    
    // MARK: application-specific attributes
    func menuBar() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMenuBarAttribute, error: &error)
    }
    
    func windows() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXWindowsAttribute,error: &error) as? [AXUIElement]
        
    }
    
    func frontmost() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXFrontmostAttribute,error: &error)
    }
    
    func hidden() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHiddenAttribute, error: &error)
    }
    
    func mainWindow() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMainWindowAttribute,error: &error)
    }
    
    func focusedWindow() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXFocusedWindowAttribute,error: &error)
    }
    
    func focusedUIElement() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXFocusedUIElementAttribute,error: &error)
    }
    
    func extrasMenuBar() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXExtrasMenuBarAttribute,error: &error)
    }
    
    
    /// A convenience attribute whose value is an element that is a header for another element. For example, an outline element has a header attribute whose value is a element of role AXGroup that contains the header buttons for each column.Used for things like tables, outlines, columns, etc.
    /// Recommended for elements that have header elements contained within them that an assistive application might want convenient access to.
    ///  Writable? No.
    /// - Returns: An AXUIElementRef whose role varies.
    func kAXHeaderAttribute() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMainWindowAttribute,error: &error)
    }
    
    func edited() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXEditedAttribute,error: &error)
    }
    
    
    func valueWraps() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXValueWrapsAttribute, error: &error)
    }
    
    func tabs() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXTabsAttribute, error: &error)
    }
    
    func titleUIElement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXTitleUIElementAttribute, error: &error)
    }
    
    func horizontalScrollBar() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHorizontalScrollBarAttribute, error: &error)
    }
    
    func verticalScrollBar() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVerticalScrollBarAttribute, error: &error)
    }
    
    func overflowButton() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXOverflowButtonAttribute, error: &error)
    }
    
    func filename() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXFilenameAttribute, error: &error)
    }
    
    func expanded() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXExpandedAttribute, error: &error)
    }
    
    func selected() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSelectedAttribute, error: &error)
    }
    
    func splitters() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSplittersAttribute, error: &error)
    }
    
    func nextContents() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXNextContentsAttribute, error: &error)
    }
    
    func document() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDocumentAttribute, error: &error)
    }
    
    func decrementButton() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDecrementButtonAttribute, error: &error)
    }
    
    func incrementButton() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXIncrementButtonAttribute, error: &error)
    }
    
    func previousContents() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXPreviousContentsAttribute, error: &error)
    }
    
    func contents() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXContentsAttribute, error: &error) as? [AXUIElement]
    }
    
    func incrementor() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXIncrementorAttribute, error: &error)
    }
    
    func hourField() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXHourFieldAttribute, error: &error)
    }
    
    func minuteField() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMinuteFieldAttribute, error: &error)
    }
    
    func secondField() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXSecondFieldAttribute, error: &error)
    }
    
    func AXAMPMField() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXAMPMFieldAttribute, error: &error)
    }
    
    func dayFieldAttribute() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXDayFieldAttribute, error: &error)
    }
    
    func monthFieldAttribute() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXMonthFieldAttribute, error: &error)
    }
    
    func yearFieldAttribute() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXYearFieldAttribute, error: &error)
    }
    
    func columnTitle() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnTitleAttribute,error: &error)
    }
    
    
    ///  Required for elements that represent a disk or network item.
    ///  Writable? No.
    /// - Returns: Value: A CFURLRef.
    func URL() -> CFURL? {
        var error : AXError = AXError.failure
        if let value = self.value(attributeKey: kAXColumnTitleAttribute, error: &error){
            let urlValue : CFURL = value as! CFURL
            return urlValue
        }
        return nil
    }
    
    
    func labelUIElements() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLabelUIElementsAttribute,error: &error)
    }
    
    func labelValue() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLabelValueAttribute,error: &error)
    }
    
    func shownMenuUIElement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXShownMenuUIElementAttribute,error: &error)
    }
    
    func servesAsTitleForUIElements() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXServesAsTitleForUIElementsAttribute,error: &error)
    }
    
    func linkedUIElements() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLinkedUIElementsAttribute,error: &error)
    }
    //MARK: table/outline view attributes
    func rows() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRowsAttribute,error: &error)
    }
    
    func visibleRows() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVisibleRowsAttribute,error: &error)
    }
    
    func selectedRows() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSelectedRowsAttribute,error: &error)
    }
    
    func columns() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnsAttribute,error: &error)
    }
    
    ///  Indicates the visible column sub-elements of a kAXBrowserRole element.This is the subset of a browser's kAXColumnsAttribute where each column in thearray is one that is currently scrolled into view within the browser. It doesnot  include any columns that are currently scrolled out of view.
    ///  Required for all browser elements.
    ///  Writable? No.
    /// - Returns: A Array of AXUIElementRefs representing the columns of a browser. The columns will be grandchild elements of the browser, and will generally be of role kAXScrollArea.
    func visibleColumns() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVisibleColumnsAttribute,error: &error) as? [AXUIElement]
    }
    
    func selectedColumns() -> [AXUIElement]? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSelectedColumnsAttribute,error: &error) as? [AXUIElement]
    }
    
    func sortDirection() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSortDirectionAttribute,error: &error)
    }
    
    //MARK: row/column attributes
    func indexAttribute() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXIndexAttribute,error: &error)
    }
    
    //MARK: outline attributes
    func disclosing() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDisclosingAttribute,error: &error)
    }
    
    func disclosedRows() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDisclosedRowsAttribute,error: &error)
    }
    
    func disclosedByRow() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDisclosedByRowAttribute,error: &error)
    }
    
    func disclosureLevel() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXDisclosureLevelAttribute,error: &error)
    }
    
    //MARK: matte attributes
    func matteHole() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMatteHoleAttribute,error: &error)
    }
    
   
    func matteContentUIElement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMatteContentUIElementAttribute,error: &error)
    }
    
    //MARK: ruler attributes
    func markerUIElements() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMarkerUIElementsAttribute,error: &error)
    }
    
    func units() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXUnitsAttribute,error: &error)
    }
    
    func unitDescription() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXUnitDescriptionAttribute,error: &error)
    }
    
    func markerType() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMarkerTypeAttribute,error: &error)
    }
    
    func markerTypeDescription() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXMarkerTypeDescriptionAttribute,error: &error)
    }
    
    //MARK: Dock attributes
    func isApplicationRunning() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXIsApplicationRunningAttribute,error: &error)
    }
    
    //MARK: search field attributes
    func searchButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXSearchButtonAttribute,error: &error)
    }
    
    func clearButton() -> AXUIElement? {
        var error : AXError = AXError.failure
        return self.valueOfAXUIElement(attributeKey: kAXClearButtonAttribute,error: &error)
    }
    
    
    //MARK: grid attributes
    func rowCount() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRowCountAttribute,error: &error)
    }
    
    func columnCount() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnCountAttribute,error: &error)
    }
    
    func orderedByRow() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXOrderedByRowAttribute,error: &error)
    }
    
    //MARK: level indicator attributes
    func warningValue() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXWarningValueAttribute,error: &error)
    }
    
    func criticalValue() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXCriticalValueAttribute,error: &error)
    }
    
    //MARK: cell-based table attributes
    func selectedCells() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXSelectedCellsAttribute,error: &error)
    }
    
    func visibleCells() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVisibleCellsAttribute,error: &error)
    }
    
    func rowHeaderUIElement() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRowHeaderUIElementsAttribute,error: &error)
    }
    
    func columnHeaderUIElements() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnHeaderUIElementsAttribute,error: &error)
    }
    
    //MARK: cell attributes
    func rowIndexRange() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRowIndexRangeAttribute,error: &error)
    }
    func columnIndexRange() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnIndexRangeAttribute,error: &error)
    }
    
    //MARK: layout area attributes
    func horizontalUnits() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHorizontalUnitsAttribute,error: &error)
    }
    
    func verticalUnits() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVerticalUnitsAttribute,error: &error)
    }
    
    func horizontalUnitDescription() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHorizontalUnitDescriptionAttribute,error: &error)
    }
    
    func verticalUnitDescription() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVerticalUnitDescriptionAttribute,error: &error)
    }
    
    func handles() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXHandlesAttribute,error: &error)
    }
    
    //MARK: obsolete/unknown attributes
    func text() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXTextAttribute,error: &error)
    }
    
    func visibleText() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXVisibleTextAttribute,error: &error)
    }
    
    func isEditable() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXIsEditableAttribute,error: &error)
    }
    
    func columnTitles() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXColumnTitlesAttribute,error: &error)
    }
    
    //MARK: obsolete/unknown attributes
    func identifier() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXIdentifierAttribute,error: &error)
    }
    
    //MARK: UI element identification attributes
    func alternateUIVisible() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXAlternateUIVisibleAttribute,error: &error)
    }
    
    //MARK: Text Suite Parameterized Attributes
    func lineForIndexParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLineForIndexParameterizedAttribute,error: &error)
    }
    
    func rangeForLineParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRangeForLineParameterizedAttribute,error: &error)
    }
    
    func stringForRangeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXStringForRangeParameterizedAttribute,error: &error)
    }
    
    func rangeForPositionParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRangeForPositionParameterizedAttribute,error: &error)
    }
    
    func rangeForIndexParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRangeForIndexParameterizedAttribute,error: &error)
    }
    
    func boundsForRangeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXBoundsForRangeParameterizedAttribute,error: &error)
    }
    
    func RTFForRangeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXRTFForRangeParameterizedAttribute,error: &error)
    }
    
    func attributedStringForRangeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXAttributedStringForRangeParameterizedAttribute,error: &error)
    }
    
    func styleRangeForIndexParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXStyleRangeForIndexParameterizedAttribute,error: &error)
    }
    
    //MARK: cell-based table parameterized attributes
    func cellForColumnAndRowParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXCellForColumnAndRowParameterizedAttribute,error: &error)
    }
    
    //MARK: layout area parameterized attributes
    func layoutPointForScreenPointParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLayoutPointForScreenPointParameterizedAttribute,error: &error)
    }
    
    func layoutSizeForScreenSizeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXLayoutSizeForScreenSizeParameterizedAttribute,error: &error)
    }
    
    func screenPointForLayoutPointParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXScreenPointForLayoutPointParameterizedAttribute,error: &error)
    }
    
    func screenSizeForLayoutSizeParameterized() -> Any? {
        var error : AXError = AXError.failure
        return self.value(attributeKey: kAXScreenSizeForLayoutSizeParameterizedAttribute,error: &error)
    }
}
