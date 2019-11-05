Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93437EF563
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2019 07:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbfKEGI7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Nov 2019 01:08:59 -0500
Received: from mga12.intel.com ([192.55.52.136]:39400 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387541AbfKEGI7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Nov 2019 01:08:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 22:08:58 -0800
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="195709598"
Received: from gliebl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.19])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 22:08:53 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Amol Grover <frextrite@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: RCU: whatisRCU: Fix formatting for section 2
In-Reply-To: <20191104173156.GA15267@workstation-kernel-dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191104133315.GA14499@workstation-kernel-dev> <87pni77jvt.fsf@intel.com> <20191104173156.GA15267@workstation-kernel-dev>
Date:   Tue, 05 Nov 2019 08:08:50 +0200
Message-ID: <87a79ayhvx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 04 Nov 2019, Amol Grover <frextrite@gmail.com> wrote:
> On Mon, Nov 04, 2019 at 05:15:34PM +0200, Jani Nikula wrote:
>> On Mon, 04 Nov 2019, Amol Grover <frextrite@gmail.com> wrote:
>> > Convert RCU API method text to sub-headings and
>> > add hyperlink and superscript to 2 literary notes
>> > under rcu_dereference() section
>> >
>> > Signed-off-by: Amol Grover <frextrite@gmail.com>
>> > ---
>> >  Documentation/RCU/whatisRCU.rst | 34 +++++++++++++++++++++++++++------
>> >  1 file changed, 28 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
>> > index ae40c8bcc56c..3cf6e17d0065 100644
>> > --- a/Documentation/RCU/whatisRCU.rst
>> > +++ b/Documentation/RCU/whatisRCU.rst
>> > @@ -150,6 +150,7 @@ later.  See the kernel docbook documentation for more info, or look directly
>> >  at the function header comments.
>> >  
>> >  rcu_read_lock()
>> > +^^^^^^^^^^^^^^^
>> >  
>> >  	void rcu_read_lock(void);
>> >  
>> > @@ -164,6 +165,7 @@ rcu_read_lock()
>> >  	longer-term references to data structures.
>> >  
>> >  rcu_read_unlock()
>> > +^^^^^^^^^^^^^^^^^
>> >  
>> >  	void rcu_read_unlock(void);
>> >  
>> > @@ -172,6 +174,7 @@ rcu_read_unlock()
>> >  	read-side critical sections may be nested and/or overlapping.
>> >  
>> >  synchronize_rcu()
>> > +^^^^^^^^^^^^^^^^^
>> >  
>> >  	void synchronize_rcu(void);
>> >  
>> > @@ -225,6 +228,7 @@ synchronize_rcu()
>> >  	checklist.txt for some approaches to limiting the update rate.
>> >  
>> >  rcu_assign_pointer()
>> > +^^^^^^^^^^^^^^^^^^^^
>> >  
>> >  	void rcu_assign_pointer(p, typeof(p) v);
>> >  
>> > @@ -245,6 +249,7 @@ rcu_assign_pointer()
>> >  	the _rcu list-manipulation primitives such as list_add_rcu().
>> >  
>> >  rcu_dereference()
>> > +^^^^^^^^^^^^^^^^^
>> >  
>> >  	typeof(p) rcu_dereference(p);
>> >  
>> > @@ -279,8 +284,10 @@ rcu_dereference()
>> >  	if an update happened while in the critical section, and incur
>> >  	unnecessary overhead on Alpha CPUs.
>> >  
>> > +.. _back_to_1:
>> > +
>> >  	Note that the value returned by rcu_dereference() is valid
>> > -	only within the enclosing RCU read-side critical section [1].
>> > +	only within the enclosing RCU read-side critical section |cs_1|.
>> >  	For example, the following is -not- legal::
>> >  
>> >  		rcu_read_lock();
>> > @@ -298,15 +305,27 @@ rcu_dereference()
>> >  	it was acquired is just as illegal as doing so with normal
>> >  	locking.
>> >  
>> > +.. _back_to_2:
>> > +
>> >  	As with rcu_assign_pointer(), an important function of
>> >  	rcu_dereference() is to document which pointers are protected by
>> >  	RCU, in particular, flagging a pointer that is subject to changing
>> >  	at any time, including immediately after the rcu_dereference().
>> >  	And, again like rcu_assign_pointer(), rcu_dereference() is
>> >  	typically used indirectly, via the _rcu list-manipulation
>> > -	primitives, such as list_for_each_entry_rcu() [2].
>> > +	primitives, such as list_for_each_entry_rcu() |entry_2|.
>> > +
>> > +.. |cs_1| raw:: html
>> 
>> Please don't use raw. It's ugly and error prone. We have some raw output
>> for latex, but this would be the first for html.
>> 
>> What are you trying to achieve?
>
> Hi Jani,
> While going through the documentation I encountered a few footnotes (numbers
> [1] and [2]) which referenced the actual footnote somewhere below the text.
> They were particularly not straight-forward to find hence I decided to
> link them to the footnote text which could be done using inline markup.
> Then I tried to make them more appealing by converting to super-scripts
> (the way they look like in books and websites). However, nested inline 
> markup is not yet possible in reST hence I went with the html way to 
> achieve the same. Too much?

I suggest you use rst footnote markup. It's less of an eye sore in the
rst source, but provides you with the links in the generated output. And
typically would be superscript. In particular "autonumber labels" might
fit the bill. [1][2]

BR,
Jani.


[1] http://docutils.sourceforge.net/docs/user/rst/quickref.html#footnotes
[2] http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#footnotes


>
> Thank you
> Amol
>
>> 
>> BR,
>> Jani.
>> 
>> > +
>> > +	<a href="#cs"><sup>[1]</sup></a>
>> > +
>> > +.. |entry_2| raw:: html
>> >  
>> > -	[1] The variant rcu_dereference_protected() can be used outside
>> > +	<a href="#entry"><sup>[2]</sup></a>
>> > +
>> > +.. _cs:
>> > +
>> > +	\ :sup:`[1]`\  The variant rcu_dereference_protected() can be used outside
>> >  	of an RCU read-side critical section as long as the usage is
>> >  	protected by locks acquired by the update-side code.  This variant
>> >  	avoids the lockdep warning that would happen when using (for
>> > @@ -317,15 +336,18 @@ rcu_dereference()
>> >  	a lockdep expression to indicate which locks must be acquired
>> >  	by the caller. If the indicated protection is not provided,
>> >  	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
>> > -	and the API's code comments for more details and example usage.
>> > +	and the API's code comments for more details and example usage. :ref:`back <back_to_1>`
>> > +
>> > +
>> > +.. _entry:
>> >  
>> > -	[2] If the list_for_each_entry_rcu() instance might be used by
>> > +	\ :sup:`[2]`\  If the list_for_each_entry_rcu() instance might be used by
>> >  	update-side code as well as by RCU readers, then an additional
>> >  	lockdep expression can be added to its list of arguments.
>> >  	For example, given an additional "lock_is_held(&mylock)" argument,
>> >  	the RCU lockdep code would complain only if this instance was
>> >  	invoked outside of an RCU read-side critical section and without
>> > -	the protection of mylock.
>> > +	the protection of mylock. :ref:`back <back_to_2>`
>> >  
>> >  The following diagram shows how each API communicates among the
>> >  reader, updater, and reclaimer.
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
