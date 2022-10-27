/*******************************************************************************
 * The MIT License (MIT)
 *
 * Copyright (c) 2022, Jean-David Gadina - www.xs-labs.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the Software), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

import Cocoa
import GitHubUpdates

private var GlobalUpdater = GitHubUpdater()

public extension NSApplication
{
    var updater: GitHubUpdater
    {
        return GlobalUpdater
    }

    @IBAction
    func showAboutWindow( _ sender: Any? )
    {
        guard let window = AboutWindowController.shared.window
        else
        {
            NSSound.beep()

            return
        }

        if window.isVisible == false
        {
            window.layoutIfNeeded()
            window.center()
        }

        window.makeKeyAndOrderFront( nil )
    }

    @IBAction
    func checkForUpdates( _ sender: Any? )
    {
        guard self.updater.user.isEmpty == false, self.updater.repository.isEmpty == false
        else
        {
            NSSound.beep()

            return
        }

        self.updater.checkForUpdates( sender )
    }
}
