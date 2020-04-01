Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D022819A2C3
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2020 02:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbgDAAIk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Mar 2020 20:08:40 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40408 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729514AbgDAAIj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Mar 2020 20:08:39 -0400
Received: by mail-qt1-f194.google.com with SMTP id y25so1258446qtv.7
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2020 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2ZJH2bqoeAK0auR/UMe60BRQ+wnm6Zhq3FSNSqtWLpQ=;
        b=SkwqLLE+Fow7/6Cah0e/j95l9bMReiVaYR4axf2TUigtGS/eaMdShdCnE1kPmtW8xR
         /2az1sR0MrFLXdNwIqYBsyjiDUKNnfELPUgcNOobar7ZtpNdp71qiqvD1LrukFi0CpgA
         J5FAkULaIxv4Ug5J2eypaO5WiiHNqJrCiCqTH4dU1J+r6tnbMHtNkwd7fNCXvIIvklvt
         9KwDKFX3E7bH2UUTKBdZIx/lHXRCJ/+99lUGzjOaXf3lY5oyFAuqifMyjkfjPGhm8ukf
         n88tUjgzfiFmlrNd+in4y5NvLTdL+hVNEBxm7PoZTDrQ9zX6o87y87BT2HzzK8pOTv7n
         /nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2ZJH2bqoeAK0auR/UMe60BRQ+wnm6Zhq3FSNSqtWLpQ=;
        b=j9R8p+tmuurUKluwq/08PxJSWsin2TDQ7arvg+0ChfTLygrxnXNzj67j1aTQH++piU
         kSYr6kPzyS3uJFKhabVmfr6ofulaIXFFUFzNcbD1IAG7vAmPE/JuQV6ymwrBx3ZfBZoq
         p39jsimx72rO/utXxW62pNDGTpQ1rRtJ3bxl214thhl9p/kopBP86vBOc7Hp1cVk4pi7
         jIesrQBDZhyU6O7GLjaIv3naKUp+MiUrZM7JIi4Dtve/4OrUAS18MlyQ7zuF/w6YB3SX
         qJAFXEtX71RNbzE40/N/wg3uM6rV392AKiDb1Gj0vAnrTA2VMhh1PxqbupB+1WiNbOU6
         ztDA==
X-Gm-Message-State: ANhLgQ0hixWUzeSz0tKrJQzkSASDuV0yJ5YgJt/Dls2cemsZMlTi3Usb
        YSmILyxcnXnPnUe7Y+uuxG8TBg==
X-Google-Smtp-Source: ADFU+vt+sCovG6L+oIaQ3zQdeuF6yYCHLi+70BqvCcjee5mfo7yd78UD47UhE9xaOFer2GPikk3WbQ==
X-Received: by 2002:ac8:2921:: with SMTP id y30mr7807073qty.161.1585699718754;
        Tue, 31 Mar 2020 17:08:38 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id b7sm383592qkc.61.2020.03.31.17.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 17:08:38 -0700 (PDT)
Message-ID: <6a307032bbd05a7405c5e6a6629071ae03f62a8c.camel@massaru.org>
Subject: Re: [PATCH 1/2] Documentation: filesystems: Convert sysfs-pci to
 ReST
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org, brendanhiggins@google.com,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-pci@vger.kernel.org
Date:   Tue, 31 Mar 2020 21:08:35 -0300
In-Reply-To: <20200401000439.GE21484@bombadil.infradead.org>
References: <cover.1585693146.git.vitor@massaru.org>
         <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
         <20200401000439.GE21484@bombadil.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-03-31 at 17:04 -0700, Matthew Wilcox wrote:
> On Tue, Mar 31, 2020 at 07:28:56PM -0300, Vitor Massaru Iha wrote:
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++-----
> > ----
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst}
> > (82%)
> > 
> > diff --git a/Documentation/filesystems/sysfs-pci.txt
> > b/Documentation/filesystems/sysfs-pci.rst
> 
> In addition to Jon's comments, for the next version, I would suggest
> cc'ing the linux-pci@vger.kernel.org mailing list.  
> 
> Also, maybe add:
> 
> F: Documentation/filesystems/sysfs-pci.rst
> 
> to the 'PCI SUBSYSTEM' section of MAINTAINERS.

Thanks Matthew.

