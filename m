Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059E93891A2
	for <lists+linux-doc@lfdr.de>; Wed, 19 May 2021 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354509AbhESOpT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 May 2021 10:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354513AbhESOo4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 10:44:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB93C06175F
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 07:43:32 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d11so14285150wrw.8
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p9EzsKAwUEoWbxJga9Lc6V9Q/wXt9Eycw+vzbvGAMdo=;
        b=EkdGxM5Pu3lbgQzfC56Fxhi2JbPsOcmQcuF8T92AcJ4NzUvMURNp9i1AferWBTSeA/
         W7nLFIFkLTAtXydfa6o1/UskE+iY3YFthjjdV9MTd16WlCBGsog4nmJDLCrk234WNB1i
         Tj8BfMRwSutc6p25S/vgIdk49Tlv69StEU2eSKFtAAwJl4L5IhJw7FqffWUNHmDxeIJT
         NrRPGa2OO7rfvqUEWc7Yg04FsaQmrr4dtCg4yE7Y1LfyFB8mapLrLyWpf7tjKuBLxuES
         QdKv4Ak2PUj2CuaC5IMMkNlojjGQsjd6eWKK1Pgkn98WJFjIOfwtxCJ+KPRKfYwdABbE
         d0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p9EzsKAwUEoWbxJga9Lc6V9Q/wXt9Eycw+vzbvGAMdo=;
        b=Ehvd9cRWtBcEiIwc7kYfdHMdh1edECSA/bwr34Wq4quxCcXO6BqADVN0kJQ/Z5UbsM
         et6F1AOSNb00O/gwYfBHSzd2/71XBIE2tZ8vGhuvAyJtfSr5I+iBTJQ3hJ5DN4P0GwF0
         AULaBgDtJv8GVyY/dL6mV7xA8LOGFIAQZhbYsVcowozqHsSHmvYvmBWcxPvV+d2c2GLr
         PY+QQorJ+rWcfN3e8c09LC27Ifn2SmSdOO7ezHMqgiinsxeCif9EEeV9qM873ehl3bLD
         sGpQCLJ4P7JmH1KCiUkmOuY6poG1etBZmnKDpY+YGJQ5DgYcjd9F+ewH/Au5oaoMS8oZ
         7OFw==
X-Gm-Message-State: AOAM5325qAwDicnKZBQ2A/fa+8dO8AiQ6ew/58Pxc39R78duo9d2OF7n
        SREQvz0910APJNGzuUF+rFSyIQ==
X-Google-Smtp-Source: ABdhPJwl7zf40CNgtL10qhlSTYIJ8i5odorihCGBLzABsn6bKmjH9uVFMLJbhvO58dxj0gKoIK/PIw==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr14922689wrl.267.1621435410817;
        Wed, 19 May 2021 07:43:30 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id w25sm21015609wmk.25.2021.05.19.07.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:43:30 -0700 (PDT)
Date:   Wed, 19 May 2021 15:43:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Drew Fustini <drew@beagleboard.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Saravana Kannan <saravanak@google.com>,
        alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 05/10] docs: update pin-control.rst references
Message-ID: <20210519144328.GA2549456@dell>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
 <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 19 May 2021, Mauro Carvalho Chehab wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/linux/device.h                  | 2 +-

>  include/linux/mfd/madera/pdata.h        | 2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  include/linux/pinctrl/pinconf-generic.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
