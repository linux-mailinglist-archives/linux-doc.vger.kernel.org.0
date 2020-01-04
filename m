Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48AF412FF6E
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jan 2020 01:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgADALx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jan 2020 19:11:53 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:43590 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgADALx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jan 2020 19:11:53 -0500
Received: by mail-il1-f195.google.com with SMTP id v69so37945918ili.10
        for <linux-doc@vger.kernel.org>; Fri, 03 Jan 2020 16:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=xKt2PPmd3ZVH3skLSMZLWe5gk5gPeWTzpSDIkOKvuyM=;
        b=cKfo4acMI290WcTrTV19qCiykdAdniIGYGGE5KiHM30OB8SfCxIKpuBwAxJY7vY7qO
         kIj6AwP6PnhvGoW/3ywmR+3axhct15ptkRvqRDHXLasYSfLjMiwvvIzNGeUdRalDi4XU
         mzABFHWUnfDK3qqqm8hGD8Nznxroh9Jsd09lwY0uXpmpisrTrxDWWilImmPtM/NXqMsk
         GxoJYdrrfA1Wq+9fwSEmbkbVOjOlYbwnNinq54Gs21jSzuLxD5VPYBhL+4G8OvVAJuXa
         58bt4kvQueCv8DPcwkWjK+tY73qS0073Ij8wtWR76qvpDQT2pLcdPR79vgE/nmIj+nTS
         O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=xKt2PPmd3ZVH3skLSMZLWe5gk5gPeWTzpSDIkOKvuyM=;
        b=nzuz+tYHq06TEDUBLKnnULhV2CiVMz+fbNE7XKrWH5HniOJhfvjX5NDW53BDwWpTOO
         rV58WzabQFKxeGQHmDWux8BIN1J+NmB9+BAbbqdLF60tTBYWiPYpd0gg0AKqSENG/6OJ
         W7fBcUC65kwn0wOZc27ZZFD25+fZdM6XOlfriEVT5ZR+UCD/9aJ6oEQKzOO3hCuKH+m9
         bXkA1Z42Xq42andWW4QQynUC/hVwAnXEGxOriFZVX/C8HVkMAC30ktJ1Gk4T2N4iTK+C
         qXhssTqEV51tdY4PXhd9+ROeIVphK97vjfr1n/KzcAvFhdAnIl1o8bEa7eObpeoLW9Fv
         hm0w==
X-Gm-Message-State: APjAAAXHLJtUQZ+ARVF4+y86OiCSodwtmvEsDG4xEPG02DuOVKdzbjD3
        sEEzgwYxI7EhEVzDjy4KYSVMBQ==
X-Google-Smtp-Source: APXvYqzYxki3BWxfIgAXwBHFoYf19/w9nt614PRZ+UMaMbO8xOSp+wTCGb8tjR09++TXHdu+cm5iRw==
X-Received: by 2002:a92:d308:: with SMTP id x8mr79828277ila.42.1578096712752;
        Fri, 03 Jan 2020 16:11:52 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id v10sm15220324iot.12.2020.01.03.16.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:11:52 -0800 (PST)
Date:   Fri, 3 Jan 2020 16:11:50 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Zong Li <zong.li@sifive.com>
cc:     corbet@lwn.net, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: gcov: enable gcov for RISC-V
In-Reply-To: <20200102030954.41225-1-zong.li@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.2001031611430.283180@viisi.sifive.com>
References: <20200102030954.41225-1-zong.li@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2 Jan 2020, Zong Li wrote:

> This patch enables GCOV code coverage measurement on RISC-V.
> Lightly tested on QEMU and Hifive Unleashed board, seems to work as
> expected.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v5.5-rc.


- Paul
