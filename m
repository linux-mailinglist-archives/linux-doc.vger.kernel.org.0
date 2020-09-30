Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6818927E341
	for <lists+linux-doc@lfdr.de>; Wed, 30 Sep 2020 10:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgI3IFW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Sep 2020 04:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgI3IFW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 04:05:22 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D8FC0613D1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 01:05:22 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id b17so708773ilr.12
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKGcxP9oDE/Scs40mmFV3vtZyRz7YJAiQHhXReHdUHg=;
        b=elI45khHftDyZJGrZINOJjv8vC4PvcXsRkTbuJQ80zUZqpW9FDSlh2a5WwALyJtwxV
         k6PeGuIs+lN6IFi25iNzcEmVneBDvSCj63nkftpARbIF9XFgbfn+5HAXBfjo0TZvbKRt
         YmrsanSewXhaWmu3gfQre7ioS7uQre8n4RmJ/8azB60QGrISpAn8F/AxqWa9vXLYBV0P
         7mVuJncouenSVLeHbY0swJEBmWew2c+nYKZhXDjmf+ANcTrSMO113kbV8TbqaZpCb2Qj
         XCydaivL8QGeRvkGJdgUXNnNj7x3PJWV0EILFYAoDAxEs/6s3WbG4kai5HXG9+iplvaw
         Za+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pKGcxP9oDE/Scs40mmFV3vtZyRz7YJAiQHhXReHdUHg=;
        b=GD5VyJy61phE/ys1IQH7e78rX7YB9VOmE3fn8CDxs7hF1da9VZqBsjsnH/uHCRc9/9
         IZmnp8Ocmzb+ZjMcWgjOs/uRuK1qmOk1k2Q6EsxPk+PbdP+TIRCXupUOSRrRf7hhcT0B
         gRld7hVn3gnWFRIJ6OOMuH+EgqpcE0Hqxdq9E4nV/xScvUMlMJaTMcUF1NbBMP+3Mb6G
         Bj2HNQ2MwPFdDWHuaQ6i8YZOv0lkbunIYjBTcy13Y8fs4OKh4zLGOAdjq9jYSM5SizFb
         nJUXtgoUqCuNLtG9x4gODZSigbiIEM8OiQTdDn9xAYyyJ3+Fp0HB7muFMhgZzgI1XFIH
         PGnQ==
X-Gm-Message-State: AOAM530L0YzMVmqlnCFQiHYaeDLsqNX37xSxRyu7HOtvffqKYTKIvSeH
        LhiELfI9MkR4lKFY9GzlV6/CrCwNpx5o/tUszIo/aw==
X-Google-Smtp-Source: ABdhPJw8sBg7rxDdwXEr7u+Gvud+qzGZmvxlsxJ1JqPSzaw7uvPqJFBpCbkdnEP2+rrm7oJxJ9372EZRAwG+Wa2Ut00=
X-Received: by 2002:a92:d8c5:: with SMTP id l5mr1009401ilo.287.1601453121514;
 Wed, 30 Sep 2020 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200929101004.20288-1-brgl@bgdev.pl> <20200929101004.20288-8-brgl@bgdev.pl>
 <20200929105320.GF3956970@smile.fi.intel.com>
In-Reply-To: <20200929105320.GF3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Sep 2020 10:05:10 +0200
Message-ID: <CAMRc=MdfH7Nsq7L7sP0zPdfqcUxFfjn7FEb1_FNLRmng-qVjPA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] gpio: mockup: increase the number of supported
 device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 12:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 29, 2020 at 12:10:01PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The driver actually supports 4 properties but we only ever set up up to
> > three. This will change however in upcoming patches so increase the
> > number of really (as in: the number the property array can hold)
> > supported properties to 4.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reported-by ? (it does not imply the necessity of Fixes tag)

I'll add it when applying.

Bartosz
