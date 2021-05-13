Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A1937F76E
	for <lists+linux-doc@lfdr.de>; Thu, 13 May 2021 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhEMMHu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 May 2021 08:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhEMMHg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 08:07:36 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAF0C061761
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d16so802913pfn.12
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=JSy1a6GCJq2YyfpTNSfJS8qqrILCcxtDE5ElH2K2/E24R3FWXdOQ02VULX9h2Pj+I+
         NtrEoxuFD2ShSH71n+IAsSvw74CstZseJ176nvisB5OpUB7L1E7Ary5a0jtBHXhivVKF
         kD+16nkHtwzi2iAoAEmeBpD4ePQ/xbCiBUASU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=HloexCQc81Bbo7yogytJFrQMVDgmbvuK1W51mX3K5ZrONIsdV6k6/UgTzy/Uy0Y1eC
         Xg2++/mrCTCoSBw8UdLlFNRfSz7iJip2B77YTJgBYYuhr4utBx5lghICyGkaSYNiWptn
         YKzd3Bk+V6ZZSGP/L7XxL6QI6czpRXzNhv6eJ/5UaIsFcyU0YBjALGB8P7xWYaMRME9S
         xeW/x4ik1gdyljT5fWoOgcqXKDb6HVj503t5J1hfdQ6Arh5uaHLgJ8Bdo06BE39lgKn2
         z4NmHeEQh4vSrIUeuR47Mz18TejjOEiX3LcBdNyGJUjxT0a3G6NjOKkOei/wmJhOklOi
         HxJQ==
X-Gm-Message-State: AOAM531OUGFNRzSL3Bbuy1x9/NCzDpfm8ASYDU/dY2FIjdBDjHsr/6tM
        ZQCPlNkkU7OxDr4g1aq5A3uo8g==
X-Google-Smtp-Source: ABdhPJwfllyYOMfe4rEresq4fLk8nKv6sDRzFnk94yymmf2sl08gP8XdMvFcQyRYMXfrGcMKqNEoqQ==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id p14mr4752238pjd.121.1620907583031;
        Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:161f:cde2:c883:ef91])
        by smtp.gmail.com with ESMTPSA id f14sm5112636pjj.53.2021.05.13.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 05:06:22 -0700 (PDT)
Date:   Thu, 13 May 2021 21:06:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        JC Kuo <jckuo@nvidia.com>, Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] lib/vsprintf: Allow to override ISO 8601 date and
 time separator
Message-ID: <YJ0WNuFr7JmSrN62@google.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <YJzymZ7m3R1ELjGD@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJzymZ7m3R1ELjGD@alley>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (21/05/13 11:34), Petr Mladek wrote:
> On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' (space) separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am going to queue the entire patchset for 5.14 via the printk tree
> the following week unless anyone complains in the meantime.

Looks good to me

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
