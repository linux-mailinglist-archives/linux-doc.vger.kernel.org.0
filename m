Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94921759C9
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2020 12:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgCBLx6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 06:53:58 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39489 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgCBLx5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Mar 2020 06:53:57 -0500
Received: by mail-wm1-f67.google.com with SMTP id c24so2837707wml.4
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2020 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=azUAbwec9h/nTfVaFPcgmhe6fEkHKvdkY4Og3qBi37Y=;
        b=r6j9t0b6YVsKN35LyP/H5lUyKRUrdC0WhAe7pyoL9zqxJsdyHeGhs2X3RPXsG77ucE
         jE/L3lSF6Wv872Mzbni4tCKo2Uf/J5FiErTEvIguKLvUeYhUGNPKhhpaGFNRNrWGk+f2
         1QjGeQADib8veuFWed0VG38BvxD1/BlcZKNZvBoIdZaKVu4tpxIefsYEaasn1pXrO6pw
         1IS1EFDyfxBfwjF3zBykGgdaT4Xa+9qN7Hg+f7ZRYZZU9a6HuY5nByYkE4VPQwAGEqOh
         HGZj0HxfvbruJPh91RNIa+cmcx57q78ersUThwaD49igmWlsnmeX5r7Lhm6Fksn6cv6m
         AmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=azUAbwec9h/nTfVaFPcgmhe6fEkHKvdkY4Og3qBi37Y=;
        b=USkT3WZ4Rch3Knq+49WcOMOl84zEeGfiik1FREDpzzXjtosCRM2p97XnUrBQRYelXz
         o+6SyteCqAmfz6LkOfB9+E0jNj51o/6npGcLEIUIucJTj5qaqDnJcxBUbVq1NazPi1y/
         HmAUxiLl7WReQ3mD2J3COTVYt3BnbxdYUaljTSBS6sggeg8Pp+GKlpk6ZcYgdnIkjnPs
         uDlrYM9Wi7F6SBWN3/U5FY7rJDoqz4akOFUpR0Tl9ip99/PBmTKPIhMxh9nC7NoK4iNt
         Og/aziuLmHY2f7vHFWzt3O/Nie+SCNRxJb1snKG2m1HtD9DfcUrH2NlTuf2Dkn6e7pFZ
         78Fg==
X-Gm-Message-State: APjAAAUWZDGX0Z66cagNYPOQSV+tC8HMP8KnRBiSsaCmwQWPakoK+cPC
        IRUSKvkMzYr+pC/4T+gBo7Vpgg==
X-Google-Smtp-Source: APXvYqynY+onBCIIhC4P/zjfJVC1tFcUN36uleAbHJTeNOVBp0N74P2fBTF9cu3aqLEh5sEG98Rv7w==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr19364122wme.75.1583150036591;
        Mon, 02 Mar 2020 03:53:56 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id j5sm27954117wrx.56.2020.03.02.03.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 03:53:55 -0800 (PST)
Date:   Mon, 2 Mar 2020 11:54:32 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/12] docs: dt: convert usage-model.txt to ReST
Message-ID: <20200302115432.GX3494@dell>
References: <cover.1583135507.git.mchehab+huawei@kernel.org>
 <0432bc8cdb6abb8618eac89d68db7441b613106d.1583135507.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0432bc8cdb6abb8618eac89d68db7441b613106d.1583135507.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 02 Mar 2020, Mauro Carvalho Chehab wrote:

> - Add a SPDX header;
> - Adjust document title;
> - Use footnoote markups;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add it to devicetree/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/index.rst            |  1 +
>  Documentation/devicetree/of_unittest.txt      |  2 +-
>  .../{usage-model.txt => usage-model.rst}      | 35 +++++++++++--------

>  include/linux/mfd/core.h                      |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  4 files changed, 23 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/{usage-model.txt => usage-model.rst} (97%)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
