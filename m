Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D07342C56
	for <lists+linux-doc@lfdr.de>; Sat, 20 Mar 2021 12:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhCTLj7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 20 Mar 2021 07:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbhCTLjc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Mar 2021 07:39:32 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F81C0613E5
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 23:29:55 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id c6so8564421qtc.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iQYzfriQFS4iM4QGzjdYe/EwNKnei3uiMSlE8+pjoTw=;
        b=RZJmA14Qn4LiKY6BI3f/uMh2na5/N/aCRPh1Pxn74IU5wK+LTAkUoMJs3JRXIujULC
         uEYz54pHgXGD/0PRED95NZMQ1GKGfWgI6T8xdCn9GjVbs+r0aZ8wzyxobxh9Y/v5+b0U
         DSNKHWZ3G0CXB8uvCQhEQz7A9Hawt7nmVwXYg0Vmix+1AKLcgUdAncZbNAOc3mY2Q0DO
         XHky0fR4qSnNI2jxx+cWWRBdl8C+vaoNs4iS9fFjAGW5hpNDOSE/VHOku8Pqh3GXwAlq
         xE5h4kZKOaDAiNtB7Q52OuYwI3u8kqLf9blWptjuIqRkfNNuu/AOxl0i6BPoTUuCD9So
         NFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iQYzfriQFS4iM4QGzjdYe/EwNKnei3uiMSlE8+pjoTw=;
        b=kCUNk5RewJQksQTyxmoxtTpvmyo4beh1X7Ehv1FNDyecDkEa9lzAaOFUzk9afah5vP
         +zkttOzbvnOKnTu5JMSqTD5SfrKhJlvUKAlA7jpwmjIjmL+Z/AZWYMwDE2ObQSLePMOp
         hEHO8J70JuXmYY+5Zvjd3K6I8bLzV7Uz72PoxwArFkYO+Gu1UMKZIALpbMCOGYAneK4T
         /EWQABmEbyaXa0GZt4GN7Kx0GuTjk2zMd3EH+2AJqmigUsR3hcld3azpEWE8eCbEMzCn
         iWC0JlLfbtjIvQwNa7gd5PWFeFnWILGxJGIZGIjeZVV5/LUaKYOkmduZBypli5XAkd7P
         SznQ==
X-Gm-Message-State: AOAM531tN0KXZJBeYZDoCI6QOtmmaYYRSW645RVXm0ThjCrve0YSe8zc
        5NZQ4TIrjOUzKBAF+cjHPh06+g==
X-Google-Smtp-Source: ABdhPJz1FMB/45PEuvrU181x6rcn5zNT04hOB3ou2ijZjBDr0Pz7vi5oxJeBK04ql8fXnQDDp8PZqg==
X-Received: by 2002:aed:2ce3:: with SMTP id g90mr1873788qtd.308.1616221794679;
        Fri, 19 Mar 2021 23:29:54 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id p7sm6221092qkc.75.2021.03.19.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 23:29:54 -0700 (PDT)
Date:   Sat, 20 Mar 2021 03:29:49 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Message-ID: <20210320062949.h2ggfmzq7lyn3zsi@calvin.localdomain>
References: <20210319045544.416138-1-jonas@protocubo.io>
 <20210319212640.GA23767@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319212640.GA23767@roeck-us.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 19, 2021 at 02:26:40PM -0700, Guenter Roeck wrote:
> On Fri, Mar 19, 2021 at 01:55:44AM -0300, Jonas Malaco wrote:
> > These are "all-in-one" CPU liquid coolers that can be monitored and
> > controlled through a proprietary USB HID protocol.
> > 
> > While the models have differently sized radiators and come with varying
> > numbers of fans, they are all indistinguishable at the software level.
> > 
> > The driver exposes fan/pump speeds and coolant temperature through the
> > standard hwmon sysfs interface.
> > 
> > Fan and pump control, while supported by the devices, are not currently
> > exposed.  The firmware accepts up to 61 trip points per channel
> > (fan/pump), but the same set of trip temperatures has to be maintained
> > for both; with pwmX_auto_point_Y_temp attributes, users would need to
> > maintain this invariant themselves.
> > 
> > Instead, fan and pump control, as well as LED control (which the device
> > also supports for 9 addressable RGB LEDs on the CPU water block) are
> > left for existing and already mature user-space tools, which can still
> > be used alongside the driver, thanks to hidraw.  A link to one, which I
> > also maintain, is provided in the documentation.
> > 
> > The implementation is based on USB traffic analysis.  It has been
> > runtime tested on x86_64, both as a built-in driver and as a module.
> > 
> > Signed-off-by: Jonas Malaco <jonas@protocubo.io>
> 
> Applied (after removing the now unnecessary spinlock.h include).

Thanks for catching/fixing that.

Jonas

> 
> Thanks,
> Guenter
