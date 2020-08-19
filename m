Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD0C24A3FA
	for <lists+linux-doc@lfdr.de>; Wed, 19 Aug 2020 18:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgHSQYc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Aug 2020 12:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgHSQYL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Aug 2020 12:24:11 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62D5C061343;
        Wed, 19 Aug 2020 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0qj0NgMXE9N5E+k0q9ljNMUsiRWKFkmPnIi16FDMGEc=; b=HlZ9h/mQIGWHSczZdWzzLw8l+9
        Jb7IErUxYlL78RPZ71SMSGS/HV3yVvuUiIK/YrwfyvTC10O8KcRT6VMnYVL0aU6CO/PcKoxUKjbEg
        FMPh3GoEkEasFRBXmnoogUTGVM8X1nLXrNJ16FeiPqu6ZKF55STetGuo6F7oJDkb7OFe+PK4ovJbA
        LbxobzPdOK8V+J3D2xXSgj1M/Gi/FLJ8k0qHIh30NkHE5oScUHkA9+e2lUTAXyQG8c7I3ipBoYqQG
        U0zEH7NCWDF7DOH+DTnpfm8m7ACzQHtRlw8IFMlAy1bIPMlB4/FKC98szZaxVo3aceR5NEss3m70T
        PvKLLcqw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8Qsd-0004c3-7w; Wed, 19 Aug 2020 16:24:03 +0000
Date:   Wed, 19 Aug 2020 17:24:03 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     "'Eric W. Biederman'" <ebiederm@xmission.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Christoph Hewllig <hch@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Stafford Horne <shorne@gmail.com>,
        Kars de Jong <jongk@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>,
        Greentime Hu <green.hu@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Xiao Yang <yangx.jy@cn.fujitsu.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "uclinux-h8-devel@lists.sourceforge.jp" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "kgdb-bugreport@lists.sourceforge.net" 
        <kgdb-bugreport@lists.sourceforge.net>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 00/11] Introduce kernel_clone(), kill _do_fork()
Message-ID: <20200819162403.GF17456@casper.infradead.org>
References: <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
 <20200819111851.GY17456@casper.infradead.org>
 <87a6yq222c.fsf@x220.int.ebiederm.org>
 <20200819134629.mvd4nupme7q2hmtz@wittgenstein>
 <87mu2qznlv.fsf@x220.int.ebiederm.org>
 <df7f7e17a730405ea182ec778eec22e1@AcuMS.aculab.com>
 <20200819154521.GE17456@casper.infradead.org>
 <ee30fecfbd534c19a6bfd11d2c4b8263@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee30fecfbd534c19a6bfd11d2c4b8263@AcuMS.aculab.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 19, 2020 at 03:55:47PM +0000, David Laight wrote:
> From: Matthew Wilcox
> > Sent: 19 August 2020 16:45
> > 
> > On Wed, Aug 19, 2020 at 03:41:48PM +0000, David Laight wrote:
> > > Does linux have an O(1) (or do I mean o(1)) pid allocator?
> > > Or does it have to do a linear scan to find a gap??
> > 
> > O(log(n)).  It uses the IDR allocator, so 'n' in this case is the
> > number of PIDs currently allocated, and it's log_64 rather than log_2
> > (which makes no difference to O() but does make a bit of a difference
> > to performance)
> 
> Still worse that O(1) - when that is just replacing a variable
> with a value read out of an array.
> Made pid lookup a trivial O(1) as well.

You'd be surprised.  We replaced the custom PID allocator with the
generic IDR allocator a few years ago and got a pretty decent speedup.

If you think you can do better, then submit patches.  You have to support
all the existing use cases, of course.
