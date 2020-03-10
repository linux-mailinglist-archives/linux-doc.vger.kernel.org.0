Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26211802B7
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2020 17:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgCJQDV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Mar 2020 12:03:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42808 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgCJQDU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 12:03:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id f5so6675667pfk.9
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wwGc0oRDc/k4j8dUulkmD33XhvnOrfO8OIhB6LZI2jI=;
        b=l9ylsw/ixks81AJpnbmc8J+73sawmAHNRQMPOJKxMqauFU8kei3T6iBEc7rQ7+a/SI
         ARHhb1/kuk9qadkP58QuAVttYc+4w/TzDyC7D6MMJjRBYdgJvWPQ4pvfptEofG6oefTv
         nIAmfIRKLK/OZOAThI/0ivf33C2pe7leLiVLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wwGc0oRDc/k4j8dUulkmD33XhvnOrfO8OIhB6LZI2jI=;
        b=G76y/OuBFHNuJrH5p3MQuJ/4sXGeVpxVFKEXCNoByJt+t9+g/PE/VeAlgHYPSuncc8
         LMm6u1n8yVOHsxF5uMrxPps3Rtv7ubsY1QCWEC7QyAeucCK8SKWJpTXElpDckXEe3pgv
         sQt2pUTmrcfTT3N5kkIfXkwJKDZLZdXUvcqaE1MLJs2xtVuBlX1OEuVq8No4mVKoQjMT
         T9voZJW5f941Ga01yYH8o2CmjO35Z/G/K5JJKOQrY4h80/dq37pSmnPiUMX936VHtSbV
         GZ0nrRXfPhwWTYdco3bMYy8H7TI094zxFpBkhmXAz/ViV6hsdbrp+85LmfsSRQjqY6WP
         hArw==
X-Gm-Message-State: ANhLgQ3K8zbDWSnNbAnLn+RkxiwlQLkrlGi8iFMwQjgAFwVKfHBRj/tp
        PGE6PuzDRX9i7GSsCi9TfJVljA==
X-Google-Smtp-Source: ADFU+vszzIfipcQ5Qgm0xpwLBMeyCO9hXzu3nVnQnDe8BXVcBpz50hEXTvbCf+lmtyG/99sKZRInhg==
X-Received: by 2002:a63:408:: with SMTP id 8mr21206486pge.285.1583856199208;
        Tue, 10 Mar 2020 09:03:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l21sm2786015pjt.7.2020.03.10.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 09:03:18 -0700 (PDT)
Date:   Tue, 10 Mar 2020 09:03:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org, swood@redhat.com, mcgrof@kernel.org,
        yzaikin@google.com, mingo@kernel.org, kernel@gpiccoli.net
Subject: Re: [PATCH] Documentation: Better document the softlockup_panic
 sysctl
Message-ID: <202003100903.572B9C543@keescook>
References: <20200310151503.11589-1-gpiccoli@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310151503.11589-1-gpiccoli@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 10, 2020 at 12:15:03PM -0300, Guilherme G. Piccoli wrote:
> Commit 9c44bc03fff4 ("softlockup: allow panic on lockup") added the
> softlockup_panic sysctl, but didn't add information about it to the file
> Documentation/admin-guide/sysctl/kernel.rst (which in that time certainly
> wasn't rst and had other name!).
> 
> This patch just adds the respective documentation and references it from
> the corresponding entry in Documentation/admin-guide/kernel-parameters.txt.
> 
> This patch was strongly based on Scott Wood's commit d22881dc13b6
> ("Documentation: Better document the hardlockup_panic sysctl").
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/admin-guide/kernel-parameters.txt |  6 +++---
>  Documentation/admin-guide/sysctl/kernel.rst     | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c07815d230bc..adf77ead02c3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4515,9 +4515,9 @@
>  
>  			A nonzero value instructs the soft-lockup detector
>  			to panic the machine when a soft-lockup occurs. This
> -			is also controlled by CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC
> -			which is the respective build-time switch to that
> -			functionality.
> +			is also controlled by kernel.softlockup_panic sysctl
> +			and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
> +			respective build-time switch to that functionality.
>  
>  	softlockup_all_cpu_backtrace=
>  			[KNL] Should the soft-lockup detector generate
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index def074807cee..95b2f3256323 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -95,6 +95,7 @@ show up in /proc/sys/kernel:
>  - shmmax                      [ sysv ipc ]
>  - shmmni
>  - softlockup_all_cpu_backtrace
> +- softlockup_panic
>  - soft_watchdog
>  - stack_erasing
>  - stop-a                      [ SPARC only ]
> @@ -1029,6 +1030,18 @@ NMI.
>  1: on detection capture more debug information.
>  
>  
> +softlockup_panic:
> +=================
> +
> +This parameter can be used to control whether the kernel panics when
> +a soft lockup is detected.
> +
> +0: don't panic on soft lockup
> +1: panic on soft lockup
> +
> +This can also be set using the softlockup_panic kernel parameter.
> +
> +
>  soft_watchdog:
>  ==============
>  
> -- 
> 2.24.1
> 

-- 
Kees Cook
