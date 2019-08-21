Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3070C985BA
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2019 22:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfHUUiG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Aug 2019 16:38:06 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44724 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfHUUiF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Aug 2019 16:38:05 -0400
Received: by mail-qt1-f196.google.com with SMTP id 44so4713768qtg.11
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2019 13:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=KBkBS4T8hAWzkfNP3gQHnK1bQ8RpJnciYJrpqq3rMf8=;
        b=NGNASHAt0aPooyP8CTgYOtb0t3kgtdGLqJ/VHFyFTEdgiE7gvblv2PrEwXcwoLyfxI
         ccDsl3wj3dinhEivqLgnXhnjdMvz9SYxIr9fpo4xGRV7gSPqHBr6rxbt2u8iEjVZdgpw
         7AE+NjJy/4oGhxrVjvzRnstX2xG3qMkv8QBUgrw6BgXzyLRd9Q1gQlOhegN3181ZOKWQ
         hisqrpXmlhJPtYveRNEhyFqUIVvw2jXBRTKqiPYR1tNoVElMJ3Vgs77iGpC9g9m12/JU
         /PQ7v6S2UdmdJ+RxLBjBRRYTkQgr4jOXbD0hugqQzNfBaj2Xn77PLl4Vddgkb4PP6FlG
         yMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=KBkBS4T8hAWzkfNP3gQHnK1bQ8RpJnciYJrpqq3rMf8=;
        b=FsjKOOmw9GoeOYYk30tu0DxcVdBPknKxlireHJEU9UXdhn6WzIeJDWf+pDHdbe41H2
         os352zZHjiqOYVDSihDsTSocv60flt+3PW+JWkPkTm7Pb/Z1Q6uqjpO+dv/X9zkqPc47
         JT5QolDHd4geAHDTdZHNKb98OpSAl2/7RHxsKGvCfTegm7mfCDclir7aVPoZ2uXXDuKR
         O1cy2Db3XfWj7tRzcllGDUVgS/gFxWIfk3pEmuZiqtnfbvGoiEnY5Q+4lOaQonHyApC9
         RYXuLXptXwm937VZxLC1pw1TnoV6IJ9taxjbD3NMiQ5pKF9vtjGcwhhTQn3/hXSnm5aQ
         scCQ==
X-Gm-Message-State: APjAAAUIBjp/G1eMsKTlzlj2HTNOgkbDcfe6stBkDNcTtYzIpTV+MpYe
        b4snhrEq3l12MLbFt8/Z2Yx0iw==
X-Google-Smtp-Source: APXvYqwe9lERHFY9Jt1Z7JNSvqvEYMbh8DR6XD7zaGMsKCtoXCi/P5AunlMu5Ut2t+UrTpcRunsngQ==
X-Received: by 2002:ac8:739a:: with SMTP id t26mr33575094qtp.65.1566419884839;
        Wed, 21 Aug 2019 13:38:04 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id e15sm9805954qtr.51.2019.08.21.13.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 13:38:04 -0700 (PDT)
Date:   Wed, 21 Aug 2019 13:37:57 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH v5 10/17] net: sgi: ioc3-eth: rework skb rx handling
Message-ID: <20190821133757.4fb5253c@cakuba.netronome.com>
In-Reply-To: <20190821162847.479c9967d4dc8026fe65fa0e@suse.de>
References: <20190819163144.3478-1-tbogendoerfer@suse.de>
        <20190819163144.3478-11-tbogendoerfer@suse.de>
        <20190819165522.451f2ea2@cakuba.netronome.com>
        <20190821162847.479c9967d4dc8026fe65fa0e@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 21 Aug 2019 16:28:47 +0200, Thomas Bogendoerfer wrote:
> > This looks like a DMA engine alignment requirement, more than an
> > optimization.  
> 
> that true, there are two constraints for the rx buffers, start must be aligned
> to 128 bytes and a buffer must not cross a 16kbyte boundary. I was already
> thinking of allocating pages and chop them up. Is there a Linux API available,
> which could help for implementing this ?
> 
> I'll probably drop this patch or only change the skb_put stuff plus RX_BUF_SIZE
> define.

Sounds a little like frag allocator (napi_alloc_frag()/
netdev_alloc_frag()), but I'm not sure you'd have sufficient control
to skip over the 16k boundary.. Perhaps others have better suggestions.
