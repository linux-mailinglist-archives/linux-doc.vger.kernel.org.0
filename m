Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE15711301D
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2019 17:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbfLDQfz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Dec 2019 11:35:55 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:45930 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfLDQfz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Dec 2019 11:35:55 -0500
Received: by mail-pj1-f68.google.com with SMTP id r11so25322pjp.12
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2019 08:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bO5izEfxsUPUv8T5otbux6mtDyOWMJqdJNoSjjVgl/c=;
        b=GlXe6Q9rSNMREEg0PMbYTSdbPIDnjfkSDLbQ3Wa7YGN7pXctZlof9E/0gZyGbNTNWR
         n6Jstsi0ucPZoPRP3fosvInk887zFN+hVI3LHi321kOPXg9QwRyuyHgPaBEDXexEimDq
         SPAyk4+8cW7fGFj648/w5ZunZiP8v+dteapA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bO5izEfxsUPUv8T5otbux6mtDyOWMJqdJNoSjjVgl/c=;
        b=CG8YFDtKf6J7C0idwno94kdj8pGDlUxsqya9V+p4OB83qGOOYBAhkDk1saFBq+uYfU
         HTyaKxguYpbYEN8gnGzQAV7RKlrXEEwyRFOfNl9ffAlXesv3aQPhr/Yyu8oF88JB5tIL
         +gbS+G0koMuGIo834E+CRc9AqrKViBEC97v6V8AP9akoZ//YzFIQQhvIBjRjPS1wB+1z
         1HgrJcY/z5uMTkRC4yIh6jINOEHQA83lE1nfR0Uu1zI8QRdsrAShi5yJczrdV00JJYOI
         Xi3Xbo85dc/huXYvmIHBSmDwKQvHybAwP1sPCFtSFrgsc7KOOyP1aVcN1LzRRZsYlERm
         9LtQ==
X-Gm-Message-State: APjAAAVcFFuU36pFojllhmv+UDtBeoa+W0qPTZ6rGkCv3C1sAQTlFMen
        g6feldtb/nFUJ02ZEWabcxuCTA==
X-Google-Smtp-Source: APXvYqxSGyLyUYiiS/+SHbLwAVTmQQ5XcWoLnPWBhsJAaT8jcO37+IiZ/iqNkU51/LPEF2rPVUPiBw==
X-Received: by 2002:a17:902:8ec8:: with SMTP id x8mr4057799plo.119.1575477354677;
        Wed, 04 Dec 2019 08:35:54 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id k4sm1427100pfk.11.2019.12.04.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 08:35:53 -0800 (PST)
Date:   Wed, 4 Dec 2019 11:35:52 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Amol Grover <frextrite@gmail.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Subject: Re: [PATCH] doc: listRCU: Add some more listRCU patterns in the
 kernel
Message-ID: <20191204163552.GE17404@google.com>
References: <20191203063941.6981-1-frextrite@gmail.com>
 <20191203064132.38d75348@lwn.net>
 <20191204082412.GA6959@workstation-kernel-dev>
 <20191204074833.44bcc079@lwn.net>
 <20191204153958.GA17404@google.com>
 <20191204084729.184480f3@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204084729.184480f3@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 04, 2019 at 08:47:29AM -0700, Jonathan Corbet wrote:
> On Wed, 4 Dec 2019 10:39:58 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > Actually I had asked Amol privately to add the backticks. It appeared
> > super weird in my browser when some function calls were rendered
> > monospace while others weren't. Not all functions were successfully
> > cross referenced for me. May be it is my kernel version?
> 
> If you have an example of a failure to cross-reference a function that
> has kerneldoc comments *that are included in the toctree*, I'd like to see
> it; that's a bug.
> 
> Changing the font on functions without anything to cross-reference to is
> easy enough and should probably be done; I'll look into it when I get a
> chance.

I tried on a different machine (my work machine) and the cross-referencing is
working fine. So I am not sure if this could be something related to Sphinx
version or I had used an older kernel tree before. This kernel tree is
Linus's master.

thanks,

 - Joel

