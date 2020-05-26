Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1752D1CE8B9
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 01:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEKXCZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 May 2020 19:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725836AbgEKXCZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 19:02:25 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E983C061A0E
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:02:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s20so4552351plp.6
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=04jfofQ0OxPjQjdmjcz7p2pCwiPU88bfh4Zyk7/WIes=;
        b=lXD9fCZ7vgAYqGcB0bReYiqjnJvrU48Dwt5nV1haDxmNlCOfiEYm0GrsD3fP9oM5Nv
         uVrt/x1RiDWtnCa/hzO/cE5U9xEz3YMrU7cfKUThQG4BF9Hu1X1WQ7wkeX4ZZpgPaWQn
         9di+/IKptsoPR84Cu8M590OKNEt3dPjlKYRuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=04jfofQ0OxPjQjdmjcz7p2pCwiPU88bfh4Zyk7/WIes=;
        b=GUtny+bivAZadvKEf3+AgC7BieGHdH4NTjsy9eIfpBlrha/QRGm+zp3mi59Kpy6z81
         Np2+l10Wzb69T7qsbJZATqSVJm37lK8xySLpJPvhr7x7TUrxZfftjAEOP7w9TjpH+bCr
         w7rnqjrjEky4m+36CAShjM4tfDgwJr+K9wVxu/CAyE5xh2Hxfyk8fjrkRe2zM5H+6oPS
         RI16XNGFYLP4aKgPteRuYaGVOQbHo7bDUPwm18SePnA/6pvCAaIaX54yAxxRdh6nbfo7
         Yn8GWsQk2ZM1NkOvAHAYo1VUs1ANL1/FYeqGSz5BWuxOfl7VN/01EroXn6NpO/nTTVAT
         kYyA==
X-Gm-Message-State: AGi0PuZ9ktOfAhXUu06/wskqwkdq1PU0cka6mrMtRgGI7t8d/a+6GR1i
        Mm7a3SdErL6ZPRrFWWOweSIn7g==
X-Google-Smtp-Source: APiQypIwNmw12IH8JOCrn9V+M/ELfF4Ie+RV3w6bNqR2TouERqOStRwtYZiQB61+8jxfB5DqlmBd2g==
X-Received: by 2002:a17:902:ec04:: with SMTP id l4mr17438394pld.6.1589238144381;
        Mon, 11 May 2020 16:02:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a2sm10027736pfg.106.2020.05.11.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:02:23 -0700 (PDT)
Date:   Mon, 11 May 2020 16:02:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 08/18] pstore/zone: Introduce common layer to manage
 storage zones
Message-ID: <202005111559.711BDC6@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-9-keescook@chromium.org>
 <c6ddff6e-25fb-4fb7-18fa-daf7281c1eb0@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6ddff6e-25fb-4fb7-18fa-daf7281c1eb0@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 11, 2020 at 04:36:21PM +0800, WeiXiong Liao wrote:
> On 2020/5/11 AM 4:24, Kees Cook wrote:
> > [...]
> > + * @time: oops/panic trigger time
> 
> The above comment should be corrected since it is not only oops/panic
> any more.

Ah yes, thanks! I'll clean these all up.

> > [...]
> > +	if (hdr->reason == KMSG_DUMP_OOPS)
> > +		hdr->counter = ++cxt->oops_counter;
> > +	else
> > +		hdr->counter = ++cxt->panic_counter;
> 
> Here should be:
> 
> 	if (hdr->reason == KMSG_DUMP_OOPS)
> 		hdr->counter = ++cxt->oops_counter;
> 	else if (hdr->reason == KMSG_DUMP_PANIC)
> 		hdr->counter = ++cxt->panic_counter;
> 	else
> 		hdr->counter = 0;

Good catch; thanks! I'll move the lost later hunk to here.

> > [...]
> > +MODULE_DESCRIPTION("Storage Manager for pstore/blk");

I'm going to leave this as-is for now since it's accurate for the
moment. :)

-- 
Kees Cook
