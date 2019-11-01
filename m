Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E53ECA19
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2019 22:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbfKAVBc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Nov 2019 17:01:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41624 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfKAVBc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Nov 2019 17:01:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id m9so11513815ljh.8
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2019 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=+DZAcrYTInC6lyw4/gChnpgNLbD0CwXM1XtbdRrklJ8=;
        b=aVO7E+zA3atTNkzfVqnxxmkg1zDuPRr1tYRKkRyejCRFmIJriUQAusYYi+gtzngpZc
         BKIEwn46Nsk1IcMdS+wvyXJMI1r2SKSo6xqwLDFWIx9MKsPVACjcJbIkD6pQsubMd7sD
         A84TO2HodjD8xuQHMs7FsRGFiFKLLdxiefENYV3dDw7NnGgZmIfDAXtsc2TPqMXU1TAZ
         RDlcQgLaCb85vyFckWnZ40MhcHzzKoVQny8Ac/uYT1kXD1W6Ope3IB3/3d6ozqu0JU3G
         2Sb725xMHCEnJPqFQiP2nqRykQkO44la10qrJeHH2QfneEvzeu9L6iSM8xLD15UcjkMZ
         XPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=+DZAcrYTInC6lyw4/gChnpgNLbD0CwXM1XtbdRrklJ8=;
        b=q69tB1iWLwnf1es5EOhnL48TnWYvTupd1689UeDTp/mDAFaQHPoKBOngiOrOvCNysM
         gPP8v+Jyk+lDBt/ZHTfMH5uySw2rdGReofkkrcffbIsb4WtUy7rqNpqvfoRZwcMbun1R
         59l4+E2UPtaYoGLYzsnlD306WGZw+U3jlBChPaSIZDiitmSx8bIon4sBG4tiloxAfhZW
         Jkhgz0Uc0osvXkanbUS+tyoznr/sgC+0IRDIGpjPnpIvupB7rcBwbeSnWAfgG+OF5Jl+
         PUZbklUiNmzpr7XPU5wl7ZDgjpSCi6oOrCQTsNcs+FU4JcVazJeSkvIsa4JpzZZ47yg2
         E9Vg==
X-Gm-Message-State: APjAAAUivL5x1JLYZWU0wSRLxDfyuzRbamkCbBJvQRmJu3CukyzVnj+Q
        D4qKhvc8F3mKMk7KcrjtX4qQoA==
X-Google-Smtp-Source: APXvYqx9itIEf0HRYsllPyEfEEXLEXY8zUHnaPXt0a3ZIEZhVf/YeUFY9oDmc9lFtPOikZd1w2D+ZQ==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr9560436lji.68.1572642089841;
        Fri, 01 Nov 2019 14:01:29 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id r22sm2741164ljk.31.2019.11.01.14.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 14:01:29 -0700 (PDT)
Date:   Fri, 1 Nov 2019 14:01:21 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        Simon Horman <simon.horman@netronome.com>
Subject: Re: [PATCH net] Documentation: netdev-FAQ: make all questions into
 headings
Message-ID: <20191101140121.3d0575dd@cakuba.netronome.com>
In-Reply-To: <20191030090252.7eedec35@cakuba.hsd1.ca.comcast.net>
References: <20191029171215.6861-1-jakub.kicinski@netronome.com>
        <20191030024430.719c73be@lwn.net>
        <20191030090252.7eedec35@cakuba.hsd1.ca.comcast.net>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Oct 2019 09:02:52 -0700, Jakub Kicinski wrote:
> On Wed, 30 Oct 2019 02:44:30 -0600, Jonathan Corbet wrote:
> > On Tue, 29 Oct 2019 10:12:15 -0700
> > Jakub Kicinski <jakub.kicinski@netronome.com> wrote:  
> > > -Q: I see a network patch and I think it should be backported to stable.
> > > ------------------------------------------------------------------------
> > > -Q: Should I request it via stable@vger.kernel.org like the references in
> > > -the kernel's Documentation/process/stable-kernel-rules.rst file say?
> > > +Q: I see a network patch and I think it should be backported to stable. Should I request it via stable@vger.kernel.org like the references in the kernel's Documentation/process/stable-kernel-rules.rst file say?
> > > +------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
> > 
> > I don't think that making these massive heading lines actually improves the
> > experience - for readers of either the plain-text or formatted docs.  If
> > you really want to create headings, the heading here should be "Stable
> > backports" or some such with the question appearing below.  But do the
> > questions really need to be headings?  
> 
> I agree that this is suboptimal. I couldn't come up with a better way
> of handling this. I think consistently formatting all questions in one
> way and answers in another make the document far easier to interpret.
> I had hard time follow the current formatting:
> 
> https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html#q-i-have-created-a-network-patch-and-i-think-it-should-be-backported-to-stable
> 
> Is there a more appropriate form of emphasis we could use here? Even
> if we add independent headings questions should remain emphasised
> _somehow_ I reckon..

I poked a little bit more, adding first level headings make the
questions smaller which is nice. But they are still headings.
Then I watched your presentation from Kernel Recipes which reminded 
me of the plan to add some per subsystem process files. Which would
obsolete this doc :) Since that's a hornet's nest I don't wish 
to poke I will leave this work for a braver soul :)
