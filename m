Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B570842962E
	for <lists+linux-doc@lfdr.de>; Mon, 11 Oct 2021 19:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbhJKR7d (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Oct 2021 13:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhJKR7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Oct 2021 13:59:32 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FF6C061570
        for <linux-doc@vger.kernel.org>; Mon, 11 Oct 2021 10:57:32 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id v20so4749561plo.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Oct 2021 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BSp2yWANVc1Phuyo/keIPaoQjZd3svkQ3tUzmadeJho=;
        b=QEFRxoZko+he7BYeS4IBgs0z2jZ+ipDMKAPvqbhZg2q1lhvAppS/5nSD2EPaBfDYxr
         kHAwyKxraJXYzoNqRMkRLdvNWg0UkPeFh6mjeFatNEhIGu7k1Ld0QfIlmlPHbQzJpLpu
         eIxWrdl71nae+vHvyBFdqo76D3k47ik+eZh8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BSp2yWANVc1Phuyo/keIPaoQjZd3svkQ3tUzmadeJho=;
        b=i5uScO4c20dyX5XU+dx3cc7JwqPs/Z/o9VLOcnkRKdJEAFijm96vSRLFC9JQ2ZKmRj
         qbLwR2yGMavwpIY4nM/B+MRUuVGs/ljK+fMk212PjPYtnKHxQY5LgMo56smVs0BGVRfb
         oYrCD21lFRcJyvuWvDUKerLdbddIb+g0dySJRXLbINaSvuZiJ4X6n8UEHC1ZhgV69hAt
         QymD+Wvox6sNJUxCKy3SltRV0+rl6ZOL/+kBlby2hfiFuUh1xMylKyCIGRYLPGFuwwLO
         M6OnxqHLUyUq4vibkS08qhAief8juPXH5bMCgNTCQxjviIytcb9KLE/QtW0Z7nZ3vC8J
         j6Tg==
X-Gm-Message-State: AOAM530tkGxAYbm2N9qFpzrrG8e/dmtNJ5yiKZPq0r7T47mzxgy0EQsf
        hfXkFpjmHkfF/uXrTy7tVqaZPA==
X-Google-Smtp-Source: ABdhPJwymYfSHFQK1xgMrSYEK2u8tbk74BTl0AzUjUEaIOEkTlpw05zJuCoA5v7CHA1pakUAeT9vHQ==
X-Received: by 2002:a17:90b:1e05:: with SMTP id pg5mr443752pjb.173.1633975047683;
        Mon, 11 Oct 2021 10:57:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u65sm669446pfb.208.2021.10.11.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:57:27 -0700 (PDT)
Date:   Mon, 11 Oct 2021 10:57:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     tj@kernel.org, gregkh@linuxfoundation.org,
        akpm@linux-foundation.org, minchan@kernel.org, jeyu@kernel.org,
        shuah@kernel.org, bvanassche@acm.org, dan.j.williams@intel.com,
        joe@perches.com, tglx@linutronix.de, rostedt@goodmis.org,
        linux-spdx@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Kuno Woudt <kuno@frob.nl>,
        Richard Fontana <fontana@sharpeleven.org>,
        copyleft-next@lists.fedorahosted.org,
        Ciaran Farrell <Ciaran.Farrell@suse.com>,
        Christopher De Nicolo <Christopher.DeNicolo@suse.com>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v8 01/12] LICENSES: Add the copyleft-next-0.3.1 license
Message-ID: <202110111057.F6678D3F@keescook>
References: <20210927163805.808907-1-mcgrof@kernel.org>
 <20210927163805.808907-2-mcgrof@kernel.org>
 <202110050907.35FBD2A1@keescook>
 <YWR2ZrtzChamY1y4@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWR2ZrtzChamY1y4@bombadil.infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 11, 2021 at 10:37:42AM -0700, Luis Chamberlain wrote:
> On Tue, Oct 05, 2021 at 09:08:59AM -0700, Kees Cook wrote:
> > On Mon, Sep 27, 2021 at 09:37:54AM -0700, Luis Chamberlain wrote:
> > I can confirm that LICENSES/dual/copyleft-next-0.3.1 matches
> > https://github.com/copyleft-next/copyleft-next/blob/master/Releases/copyleft-next-0.3.1
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> > > +   If the Derived Work includes material licensed under the GPL, You may
> > > +   instead license the Derived Work under the GPL.
> > > +   
> > 
> > nit: needless whitespace, though technically the original license
> > includes this too. :)
> 
> Indeed, I decided to leave the white space as the original had it too.
> Should I really get rid of the space or keep it?

Probably keep it for 0 diff with original. :)

-- 
Kees Cook
