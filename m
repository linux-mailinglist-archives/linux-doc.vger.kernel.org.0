Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACB256FA5
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2019 19:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbfFZRf5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 13:35:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:40906 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfFZRf4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 13:35:56 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 136D1537;
        Wed, 26 Jun 2019 17:29:11 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 2/4] docs: remove :c:func: annotations from xarray.rst
Date:   Wed, 26 Jun 2019 11:28:57 -0600
Message-Id: <20190626172859.16113-3-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626172859.16113-1-corbet@lwn.net>
References: <20190626172859.16113-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the build system automatically marks up function references, we
don't have to clutter the source files, so take it out.

[Some paragraphs could now benefit from refilling, but that was left out to
avoid obscuring the real changes.]

Acked-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/xarray.rst | 270 +++++++++++++++---------------
 1 file changed, 135 insertions(+), 135 deletions(-)

diff --git a/Documentation/core-api/xarray.rst b/Documentation/core-api/xarray.rst
index ef6f9f98f595..fcedc5349ace 100644
--- a/Documentation/core-api/xarray.rst
+++ b/Documentation/core-api/xarray.rst
@@ -30,27 +30,27 @@ it called marks.  Each mark may be set or cleared independently of
 the others.  You can iterate over entries which are marked.
 
 Normal pointers may be stored in the XArray directly.  They must be 4-byte
-aligned, which is true for any pointer returned from :c:func:`kmalloc` and
-:c:func:`alloc_page`.  It isn't true for arbitrary user-space pointers,
+aligned, which is true for any pointer returned from kmalloc() and
+alloc_page().  It isn't true for arbitrary user-space pointers,
 nor for function pointers.  You can store pointers to statically allocated
 objects, as long as those objects have an alignment of at least 4.
 
 You can also store integers between 0 and ``LONG_MAX`` in the XArray.
-You must first convert it into an entry using :c:func:`xa_mk_value`.
+You must first convert it into an entry using xa_mk_value().
 When you retrieve an entry from the XArray, you can check whether it is
-a value entry by calling :c:func:`xa_is_value`, and convert it back to
-an integer by calling :c:func:`xa_to_value`.
+a value entry by calling xa_is_value(), and convert it back to
+an integer by calling xa_to_value().
 
 Some users want to store tagged pointers instead of using the marks
-described above.  They can call :c:func:`xa_tag_pointer` to create an
-entry with a tag, :c:func:`xa_untag_pointer` to turn a tagged entry
-back into an untagged pointer and :c:func:`xa_pointer_tag` to retrieve
+described above.  They can call xa_tag_pointer() to create an
+entry with a tag, xa_untag_pointer() to turn a tagged entry
+back into an untagged pointer and xa_pointer_tag() to retrieve
 the tag of an entry.  Tagged pointers use the same bits that are used
 to distinguish value entries from normal pointers, so each user must
 decide whether they want to store value entries or tagged pointers in
 any particular XArray.
 
-The XArray does not support storing :c:func:`IS_ERR` pointers as some
+The XArray does not support storing IS_ERR() pointers as some
 conflict with value entries or internal entries.
 
 An unusual feature of the XArray is the ability to create entries which
@@ -64,89 +64,89 @@ entry will cause the XArray to forget about the range.
 Normal API
 ==========
 
-Start by initialising an XArray, either with :c:func:`DEFINE_XARRAY`
-for statically allocated XArrays or :c:func:`xa_init` for dynamically
+Start by initialising an XArray, either with DEFINE_XARRAY()
+for statically allocated XArrays or xa_init() for dynamically
 allocated ones.  A freshly-initialised XArray contains a ``NULL``
 pointer at every index.
 
-You can then set entries using :c:func:`xa_store` and get entries
-using :c:func:`xa_load`.  xa_store will overwrite any entry with the
+You can then set entries using xa_store() and get entries
+using xa_load().  xa_store will overwrite any entry with the
 new entry and return the previous entry stored at that index.  You can
-use :c:func:`xa_erase` instead of calling :c:func:`xa_store` with a
+use xa_erase() instead of calling xa_store() with a
 ``NULL`` entry.  There is no difference between an entry that has never
 been stored to, one that has been erased and one that has most recently
 had ``NULL`` stored to it.
 
 You can conditionally replace an entry at an index by using
-:c:func:`xa_cmpxchg`.  Like :c:func:`cmpxchg`, it will only succeed if
+xa_cmpxchg().  Like cmpxchg(), it will only succeed if
 the entry at that index has the 'old' value.  It also returns the entry
 which was at that index; if it returns the same entry which was passed as
-'old', then :c:func:`xa_cmpxchg` succeeded.
+'old', then xa_cmpxchg() succeeded.
 
 If you want to only store a new entry to an index if the current entry
-at that index is ``NULL``, you can use :c:func:`xa_insert` which
+at that index is ``NULL``, you can use xa_insert() which
 returns ``-EBUSY`` if the entry is not empty.
 
 You can enquire whether a mark is set on an entry by using
-:c:func:`xa_get_mark`.  If the entry is not ``NULL``, you can set a mark
-on it by using :c:func:`xa_set_mark` and remove the mark from an entry by
-calling :c:func:`xa_clear_mark`.  You can ask whether any entry in the
-XArray has a particular mark set by calling :c:func:`xa_marked`.
+xa_get_mark().  If the entry is not ``NULL``, you can set a mark
+on it by using xa_set_mark() and remove the mark from an entry by
+calling xa_clear_mark().  You can ask whether any entry in the
+XArray has a particular mark set by calling xa_marked().
 
 You can copy entries out of the XArray into a plain array by calling
-:c:func:`xa_extract`.  Or you can iterate over the present entries in
-the XArray by calling :c:func:`xa_for_each`.  You may prefer to use
-:c:func:`xa_find` or :c:func:`xa_find_after` to move to the next present
+xa_extract().  Or you can iterate over the present entries in
+the XArray by calling xa_for_each().  You may prefer to use
+xa_find() or xa_find_after() to move to the next present
 entry in the XArray.
 
-Calling :c:func:`xa_store_range` stores the same entry in a range
+Calling xa_store_range() stores the same entry in a range
 of indices.  If you do this, some of the other operations will behave
 in a slightly odd way.  For example, marking the entry at one index
 may result in the entry being marked at some, but not all of the other
 indices.  Storing into one index may result in the entry retrieved by
 some, but not all of the other indices changing.
 
-Sometimes you need to ensure that a subsequent call to :c:func:`xa_store`
-will not need to allocate memory.  The :c:func:`xa_reserve` function
+Sometimes you need to ensure that a subsequent call to xa_store()
+will not need to allocate memory.  The xa_reserve() function
 will store a reserved entry at the indicated index.  Users of the
 normal API will see this entry as containing ``NULL``.  If you do
-not need to use the reserved entry, you can call :c:func:`xa_release`
+not need to use the reserved entry, you can call xa_release()
 to remove the unused entry.  If another user has stored to the entry
-in the meantime, :c:func:`xa_release` will do nothing; if instead you
-want the entry to become ``NULL``, you should use :c:func:`xa_erase`.
-Using :c:func:`xa_insert` on a reserved entry will fail.
+in the meantime, xa_release() will do nothing; if instead you
+want the entry to become ``NULL``, you should use xa_erase().
+Using xa_insert() on a reserved entry will fail.
 
-If all entries in the array are ``NULL``, the :c:func:`xa_empty` function
+If all entries in the array are ``NULL``, the xa_empty() function
 will return ``true``.
 
 Finally, you can remove all entries from an XArray by calling
-:c:func:`xa_destroy`.  If the XArray entries are pointers, you may wish
+xa_destroy().  If the XArray entries are pointers, you may wish
 to free the entries first.  You can do this by iterating over all present
-entries in the XArray using the :c:func:`xa_for_each` iterator.
+entries in the XArray using the xa_for_each() iterator.
 
 Allocating XArrays
 ------------------
 
-If you use :c:func:`DEFINE_XARRAY_ALLOC` to define the XArray, or
-initialise it by passing ``XA_FLAGS_ALLOC`` to :c:func:`xa_init_flags`,
+If you use DEFINE_XARRAY_ALLOC() to define the XArray, or
+initialise it by passing ``XA_FLAGS_ALLOC`` to xa_init_flags(),
 the XArray changes to track whether entries are in use or not.
 
-You can call :c:func:`xa_alloc` to store the entry at an unused index
+You can call xa_alloc() to store the entry at an unused index
 in the XArray.  If you need to modify the array from interrupt context,
-you can use :c:func:`xa_alloc_bh` or :c:func:`xa_alloc_irq` to disable
+you can use xa_alloc_bh() or xa_alloc_irq() to disable
 interrupts while allocating the ID.
 
-Using :c:func:`xa_store`, :c:func:`xa_cmpxchg` or :c:func:`xa_insert` will
+Using xa_store(), xa_cmpxchg() or xa_insert() will
 also mark the entry as being allocated.  Unlike a normal XArray, storing
-``NULL`` will mark the entry as being in use, like :c:func:`xa_reserve`.
-To free an entry, use :c:func:`xa_erase` (or :c:func:`xa_release` if
+``NULL`` will mark the entry as being in use, like xa_reserve().
+To free an entry, use xa_erase() (or xa_release() if
 you only want to free the entry if it's ``NULL``).
 
 By default, the lowest free entry is allocated starting from 0.  If you
 want to allocate entries starting at 1, it is more efficient to use
-:c:func:`DEFINE_XARRAY_ALLOC1` or ``XA_FLAGS_ALLOC1``.  If you want to
+DEFINE_XARRAY_ALLOC1() or ``XA_FLAGS_ALLOC1``.  If you want to
 allocate IDs up to a maximum, then wrap back around to the lowest free
-ID, you can use :c:func:`xa_alloc_cyclic`.
+ID, you can use xa_alloc_cyclic().
 
 You cannot use ``XA_MARK_0`` with an allocating XArray as this mark
 is used to track whether an entry is free or not.  The other marks are
@@ -155,17 +155,17 @@ available for your use.
 Memory allocation
 -----------------
 
-The :c:func:`xa_store`, :c:func:`xa_cmpxchg`, :c:func:`xa_alloc`,
-:c:func:`xa_reserve` and :c:func:`xa_insert` functions take a gfp_t
+The xa_store(), xa_cmpxchg(), xa_alloc(),
+xa_reserve() and xa_insert() functions take a gfp_t
 parameter in case the XArray needs to allocate memory to store this entry.
 If the entry is being deleted, no memory allocation needs to be performed,
 and the GFP flags specified will be ignored.
 
 It is possible for no memory to be allocatable, particularly if you pass
 a restrictive set of GFP flags.  In that case, the functions return a
-special value which can be turned into an errno using :c:func:`xa_err`.
+special value which can be turned into an errno using xa_err().
 If you don't need to know exactly which error occurred, using
-:c:func:`xa_is_err` is slightly more efficient.
+xa_is_err() is slightly more efficient.
 
 Locking
 -------
@@ -174,54 +174,54 @@ When using the Normal API, you do not have to worry about locking.
 The XArray uses RCU and an internal spinlock to synchronise access:
 
 No lock needed:
- * :c:func:`xa_empty`
- * :c:func:`xa_marked`
+ * xa_empty()
+ * xa_marked()
 
 Takes RCU read lock:
- * :c:func:`xa_load`
- * :c:func:`xa_for_each`
- * :c:func:`xa_find`
- * :c:func:`xa_find_after`
- * :c:func:`xa_extract`
- * :c:func:`xa_get_mark`
+ * xa_load()
+ * xa_for_each()
+ * xa_find()
+ * xa_find_after()
+ * xa_extract()
+ * xa_get_mark()
 
 Takes xa_lock internally:
- * :c:func:`xa_store`
- * :c:func:`xa_store_bh`
- * :c:func:`xa_store_irq`
- * :c:func:`xa_insert`
- * :c:func:`xa_insert_bh`
- * :c:func:`xa_insert_irq`
- * :c:func:`xa_erase`
- * :c:func:`xa_erase_bh`
- * :c:func:`xa_erase_irq`
- * :c:func:`xa_cmpxchg`
- * :c:func:`xa_cmpxchg_bh`
- * :c:func:`xa_cmpxchg_irq`
- * :c:func:`xa_store_range`
- * :c:func:`xa_alloc`
- * :c:func:`xa_alloc_bh`
- * :c:func:`xa_alloc_irq`
- * :c:func:`xa_reserve`
- * :c:func:`xa_reserve_bh`
- * :c:func:`xa_reserve_irq`
- * :c:func:`xa_destroy`
- * :c:func:`xa_set_mark`
- * :c:func:`xa_clear_mark`
+ * xa_store()
+ * xa_store_bh()
+ * xa_store_irq()
+ * xa_insert()
+ * xa_insert_bh()
+ * xa_insert_irq()
+ * xa_erase()
+ * xa_erase_bh()
+ * xa_erase_irq()
+ * xa_cmpxchg()
+ * xa_cmpxchg_bh()
+ * xa_cmpxchg_irq()
+ * xa_store_range()
+ * xa_alloc()
+ * xa_alloc_bh()
+ * xa_alloc_irq()
+ * xa_reserve()
+ * xa_reserve_bh()
+ * xa_reserve_irq()
+ * xa_destroy()
+ * xa_set_mark()
+ * xa_clear_mark()
 
 Assumes xa_lock held on entry:
- * :c:func:`__xa_store`
- * :c:func:`__xa_insert`
- * :c:func:`__xa_erase`
- * :c:func:`__xa_cmpxchg`
- * :c:func:`__xa_alloc`
- * :c:func:`__xa_set_mark`
- * :c:func:`__xa_clear_mark`
+ * __xa_store()
+ * __xa_insert()
+ * __xa_erase()
+ * __xa_cmpxchg()
+ * __xa_alloc()
+ * __xa_set_mark()
+ * __xa_clear_mark()
 
 If you want to take advantage of the lock to protect the data structures
-that you are storing in the XArray, you can call :c:func:`xa_lock`
-before calling :c:func:`xa_load`, then take a reference count on the
-object you have found before calling :c:func:`xa_unlock`.  This will
+that you are storing in the XArray, you can call xa_lock()
+before calling xa_load(), then take a reference count on the
+object you have found before calling xa_unlock().  This will
 prevent stores from removing the object from the array between looking
 up the object and incrementing the refcount.  You can also use RCU to
 avoid dereferencing freed memory, but an explanation of that is beyond
@@ -261,7 +261,7 @@ context and then erase them in softirq context, you can do that this way::
     }
 
 If you are going to modify the XArray from interrupt or softirq context,
-you need to initialise the array using :c:func:`xa_init_flags`, passing
+you need to initialise the array using xa_init_flags(), passing
 ``XA_FLAGS_LOCK_IRQ`` or ``XA_FLAGS_LOCK_BH``.
 
 The above example also shows a common pattern of wanting to extend the
@@ -269,20 +269,20 @@ coverage of the xa_lock on the store side to protect some statistics
 associated with the array.
 
 Sharing the XArray with interrupt context is also possible, either
-using :c:func:`xa_lock_irqsave` in both the interrupt handler and process
-context, or :c:func:`xa_lock_irq` in process context and :c:func:`xa_lock`
+using xa_lock_irqsave() in both the interrupt handler and process
+context, or xa_lock_irq() in process context and xa_lock()
 in the interrupt handler.  Some of the more common patterns have helper
-functions such as :c:func:`xa_store_bh`, :c:func:`xa_store_irq`,
-:c:func:`xa_erase_bh`, :c:func:`xa_erase_irq`, :c:func:`xa_cmpxchg_bh`
-and :c:func:`xa_cmpxchg_irq`.
+functions such as xa_store_bh(), xa_store_irq(),
+xa_erase_bh(), xa_erase_irq(), xa_cmpxchg_bh()
+and xa_cmpxchg_irq().
 
 Sometimes you need to protect access to the XArray with a mutex because
 that lock sits above another mutex in the locking hierarchy.  That does
-not entitle you to use functions like :c:func:`__xa_erase` without taking
+not entitle you to use functions like __xa_erase() without taking
 the xa_lock; the xa_lock is used for lockdep validation and will be used
 for other purposes in the future.
 
-The :c:func:`__xa_set_mark` and :c:func:`__xa_clear_mark` functions are also
+The __xa_set_mark() and __xa_clear_mark() functions are also
 available for situations where you look up an entry and want to atomically
 set or clear a mark.  It may be more efficient to use the advanced API
 in this case, as it will save you from walking the tree twice.
@@ -300,27 +300,27 @@ indeed the normal API is implemented in terms of the advanced API.  The
 advanced API is only available to modules with a GPL-compatible license.
 
 The advanced API is based around the xa_state.  This is an opaque data
-structure which you declare on the stack using the :c:func:`XA_STATE`
+structure which you declare on the stack using the XA_STATE()
 macro.  This macro initialises the xa_state ready to start walking
 around the XArray.  It is used as a cursor to maintain the position
 in the XArray and let you compose various operations together without
 having to restart from the top every time.
 
 The xa_state is also used to store errors.  You can call
-:c:func:`xas_error` to retrieve the error.  All operations check whether
+xas_error() to retrieve the error.  All operations check whether
 the xa_state is in an error state before proceeding, so there's no need
 for you to check for an error after each call; you can make multiple
 calls in succession and only check at a convenient point.  The only
 errors currently generated by the XArray code itself are ``ENOMEM`` and
 ``EINVAL``, but it supports arbitrary errors in case you want to call
-:c:func:`xas_set_err` yourself.
+xas_set_err() yourself.
 
-If the xa_state is holding an ``ENOMEM`` error, calling :c:func:`xas_nomem`
+If the xa_state is holding an ``ENOMEM`` error, calling xas_nomem()
 will attempt to allocate more memory using the specified gfp flags and
 cache it in the xa_state for the next attempt.  The idea is that you take
 the xa_lock, attempt the operation and drop the lock.  The operation
 attempts to allocate memory while holding the lock, but it is more
-likely to fail.  Once you have dropped the lock, :c:func:`xas_nomem`
+likely to fail.  Once you have dropped the lock, xas_nomem()
 can try harder to allocate more memory.  It will return ``true`` if it
 is worth retrying the operation (i.e. that there was a memory error *and*
 more memory was allocated).  If it has previously allocated memory, and
@@ -333,7 +333,7 @@ Internal Entries
 The XArray reserves some entries for its own purposes.  These are never
 exposed through the normal API, but when using the advanced API, it's
 possible to see them.  Usually the best way to handle them is to pass them
-to :c:func:`xas_retry`, and retry the operation if it returns ``true``.
+to xas_retry(), and retry the operation if it returns ``true``.
 
 .. flat-table::
    :widths: 1 1 6
@@ -343,89 +343,89 @@ to :c:func:`xas_retry`, and retry the operation if it returns ``true``.
      - Usage
 
    * - Node
-     - :c:func:`xa_is_node`
+     - xa_is_node()
      - An XArray node.  May be visible when using a multi-index xa_state.
 
    * - Sibling
-     - :c:func:`xa_is_sibling`
+     - xa_is_sibling()
      - A non-canonical entry for a multi-index entry.  The value indicates
        which slot in this node has the canonical entry.
 
    * - Retry
-     - :c:func:`xa_is_retry`
+     - xa_is_retry()
      - This entry is currently being modified by a thread which has the
        xa_lock.  The node containing this entry may be freed at the end
        of this RCU period.  You should restart the lookup from the head
        of the array.
 
    * - Zero
-     - :c:func:`xa_is_zero`
+     - xa_is_zero()
      - Zero entries appear as ``NULL`` through the Normal API, but occupy
        an entry in the XArray which can be used to reserve the index for
        future use.  This is used by allocating XArrays for allocated entries
        which are ``NULL``.
 
 Other internal entries may be added in the future.  As far as possible, they
-will be handled by :c:func:`xas_retry`.
+will be handled by xas_retry().
 
 Additional functionality
 ------------------------
 
-The :c:func:`xas_create_range` function allocates all the necessary memory
+The xas_create_range() function allocates all the necessary memory
 to store every entry in a range.  It will set ENOMEM in the xa_state if
 it cannot allocate memory.
 
-You can use :c:func:`xas_init_marks` to reset the marks on an entry
+You can use xas_init_marks() to reset the marks on an entry
 to their default state.  This is usually all marks clear, unless the
 XArray is marked with ``XA_FLAGS_TRACK_FREE``, in which case mark 0 is set
 and all other marks are clear.  Replacing one entry with another using
-:c:func:`xas_store` will not reset the marks on that entry; if you want
+xas_store() will not reset the marks on that entry; if you want
 the marks reset, you should do that explicitly.
 
-The :c:func:`xas_load` will walk the xa_state as close to the entry
+The xas_load() will walk the xa_state as close to the entry
 as it can.  If you know the xa_state has already been walked to the
 entry and need to check that the entry hasn't changed, you can use
-:c:func:`xas_reload` to save a function call.
+xas_reload() to save a function call.
 
 If you need to move to a different index in the XArray, call
-:c:func:`xas_set`.  This resets the cursor to the top of the tree, which
+xas_set().  This resets the cursor to the top of the tree, which
 will generally make the next operation walk the cursor to the desired
 spot in the tree.  If you want to move to the next or previous index,
-call :c:func:`xas_next` or :c:func:`xas_prev`.  Setting the index does
+call xas_next() or xas_prev().  Setting the index does
 not walk the cursor around the array so does not require a lock to be
 held, while moving to the next or previous index does.
 
-You can search for the next present entry using :c:func:`xas_find`.  This
-is the equivalent of both :c:func:`xa_find` and :c:func:`xa_find_after`;
+You can search for the next present entry using xas_find().  This
+is the equivalent of both xa_find() and xa_find_after();
 if the cursor has been walked to an entry, then it will find the next
 entry after the one currently referenced.  If not, it will return the
-entry at the index of the xa_state.  Using :c:func:`xas_next_entry` to
-move to the next present entry instead of :c:func:`xas_find` will save
+entry at the index of the xa_state.  Using xas_next_entry() to
+move to the next present entry instead of xas_find() will save
 a function call in the majority of cases at the expense of emitting more
 inline code.
 
-The :c:func:`xas_find_marked` function is similar.  If the xa_state has
+The xas_find_marked() function is similar.  If the xa_state has
 not been walked, it will return the entry at the index of the xa_state,
 if it is marked.  Otherwise, it will return the first marked entry after
-the entry referenced by the xa_state.  The :c:func:`xas_next_marked`
-function is the equivalent of :c:func:`xas_next_entry`.
+the entry referenced by the xa_state.  The xas_next_marked()
+function is the equivalent of xas_next_entry().
 
-When iterating over a range of the XArray using :c:func:`xas_for_each`
-or :c:func:`xas_for_each_marked`, it may be necessary to temporarily stop
-the iteration.  The :c:func:`xas_pause` function exists for this purpose.
+When iterating over a range of the XArray using xas_for_each()
+or xas_for_each_marked(), it may be necessary to temporarily stop
+the iteration.  The xas_pause() function exists for this purpose.
 After you have done the necessary work and wish to resume, the xa_state
 is in an appropriate state to continue the iteration after the entry
 you last processed.  If you have interrupts disabled while iterating,
 then it is good manners to pause the iteration and reenable interrupts
 every ``XA_CHECK_SCHED`` entries.
 
-The :c:func:`xas_get_mark`, :c:func:`xas_set_mark` and
-:c:func:`xas_clear_mark` functions require the xa_state cursor to have
+The xas_get_mark(), xas_set_mark() and
+xas_clear_mark() functions require the xa_state cursor to have
 been moved to the appropriate location in the xarray; they will do
-nothing if you have called :c:func:`xas_pause` or :c:func:`xas_set`
+nothing if you have called xas_pause() or xas_set()
 immediately before.
 
-You can call :c:func:`xas_set_update` to have a callback function
+You can call xas_set_update() to have a callback function
 called each time the XArray updates a node.  This is used by the page
 cache workingset code to maintain its list of nodes which contain only
 shadow entries.
@@ -443,25 +443,25 @@ eg indices 64-127 may be tied together, but 2-6 may not be.  This may
 save substantial quantities of memory; for example tying 512 entries
 together will save over 4kB.
 
-You can create a multi-index entry by using :c:func:`XA_STATE_ORDER`
-or :c:func:`xas_set_order` followed by a call to :c:func:`xas_store`.
-Calling :c:func:`xas_load` with a multi-index xa_state will walk the
+You can create a multi-index entry by using XA_STATE_ORDER()
+or xas_set_order() followed by a call to xas_store().
+Calling xas_load() with a multi-index xa_state will walk the
 xa_state to the right location in the tree, but the return value is not
 meaningful, potentially being an internal entry or ``NULL`` even when there
-is an entry stored within the range.  Calling :c:func:`xas_find_conflict`
+is an entry stored within the range.  Calling xas_find_conflict()
 will return the first entry within the range or ``NULL`` if there are no
-entries in the range.  The :c:func:`xas_for_each_conflict` iterator will
+entries in the range.  The xas_for_each_conflict() iterator will
 iterate over every entry which overlaps the specified range.
 
-If :c:func:`xas_load` encounters a multi-index entry, the xa_index
+If xas_load() encounters a multi-index entry, the xa_index
 in the xa_state will not be changed.  When iterating over an XArray
-or calling :c:func:`xas_find`, if the initial index is in the middle
+or calling xas_find(), if the initial index is in the middle
 of a multi-index entry, it will not be altered.  Subsequent calls
 or iterations will move the index to the first index in the range.
 Each entry will only be returned once, no matter how many indices it
 occupies.
 
-Using :c:func:`xas_next` or :c:func:`xas_prev` with a multi-index xa_state
+Using xas_next() or xas_prev() with a multi-index xa_state
 is not supported.  Using either of these functions on a multi-index entry
 will reveal sibling entries; these should be skipped over by the caller.
 
-- 
2.21.0

