Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E59212FEE1
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jan 2020 23:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgACWeg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jan 2020 17:34:36 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35694 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbgACWef (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jan 2020 17:34:35 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so24017869pgk.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jan 2020 14:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h60rRNccMZJTfBCOaaZOGtPzFnUj3qhlo+KAwuFhXj4=;
        b=EsRBtjZirRTdy5HMs9mwnGgaerFsPYYqRUS6NlbsMnBCmQrRX1WHLJ5Jibwv3bCb6C
         b/j2ylwjseFZg2SwJs2fmnkeAgR+TkDBirvihpi8deTA2+TiyHIkwJwg7yAcK9VQRbFb
         xwlU5L/2ocVUSa4PgbN+se/k9FeMGbca7sX3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h60rRNccMZJTfBCOaaZOGtPzFnUj3qhlo+KAwuFhXj4=;
        b=jQANOaV5DZhoAPMnNsnQQD7PN+4A38eCX/s1dMHumsMEm1Jv4Wev9v6+q4o1nHyD21
         KllTRc5PdBHD3EySc/M5ITtSevUVzI8HfapkxtXkxccPT9jDb334GT+YYdRe1rh0nvOX
         GpOAnvr78NgwBh3EEn99gagJ9oMxc3buYtaApV4+F699hemnoIorNE2ZNDyKwjxuOofv
         /JuVsp6aZGoEHhpZ32T5xZxYPdcVNVmFCFunWsBIn7ji+Rs6A1gyLVBVzqzVLWvK0uy2
         pP10qvLquqDB5I9+Txyfkzu/ZM6pJYM5sA8FeF5p5BkWX4g56qw+1FQx2l6y9Cak3GQe
         WdhA==
X-Gm-Message-State: APjAAAVYEindGWWdMGhpdlthNFuzPqMHiFYv7Xg+XirAoaWRXQmPSbeI
        IM2NzVbmNMYRB/EC/VawBu3dYg==
X-Google-Smtp-Source: APXvYqy1YUoGW3Za8vGr40ZH9+xrVnbTaEXYDDClQiRfun8PIdxUTxNeSYtOh1+mbI40AVtXs68Jsg==
X-Received: by 2002:a63:e545:: with SMTP id z5mr97558800pgj.209.1578090875439;
        Fri, 03 Jan 2020 14:34:35 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id g18sm65172822pfi.80.2020.01.03.14.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:34:34 -0800 (PST)
Date:   Fri, 3 Jan 2020 17:34:33 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        nachukannan@gmail.com, rdunlap@infradead.org
Subject: Re: [PATCH v3 0/3] docs: ftrace: Fix minor issues in the doc
Message-ID: <20200103223433.GB189259@google.com>
References: <cover.1577231751.git.frank@generalsoftwareinc.com>
 <20200103114828.15581051@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103114828.15581051@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 03, 2020 at 11:48:28AM -0500, Steven Rostedt wrote:
> On Tue, 24 Dec 2019 19:05:38 -0500
> "Frank A. Cancio Bello" <frank@generalsoftwareinc.com> wrote:
> 
> > I didn't want to be pushy with these minor fixes but occur to me
> > now that, even all seem to be clear in the latest version of the
> > RFC (v2) related to these fixes, a clean patchset could be expected
> > after such RFC. So here we go:
> > 
> > Clarifies the RAM footprint of buffer_size_kb without getting into
> > implementation details.
> > 
> > Fix typos and a small notation mistakes in the doc.
> > 
> 
> Jon,
> 
> Can you take these in your tree?
> 
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> 
> Thanks!
> 
> -- Steve
