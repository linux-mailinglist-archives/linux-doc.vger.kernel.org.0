Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD169522A
	for <lists+linux-doc@lfdr.de>; Tue, 20 Aug 2019 02:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbfHTAHq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Aug 2019 20:07:46 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42907 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbfHTAHp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Aug 2019 20:07:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id t12so4003871qtp.9
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2019 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=XAiAnlHmkO+0jIPS0nCrMqFBgMcioHrpGQSObqqyeas=;
        b=dfIUq6ddf9ulKASU6Bv2+Z+qverPNdci02k7EuMkUVkCz1tzrPT2V+peCQB1mSaYn2
         WbClo3aQBa1BfkNHVrbwUW9+4yBrOVVxNn+YsIKbgq6VUxYvdz73CgyNgwAxj6PZS5OJ
         6JYvvcuEX9N1qMJfiar986WkawCYWvo4FHiHy7AiM8/0h9oRftPVOhvBxSTeWF4NwtEi
         PWVsa8m13KOJVYNQbzKp+bw38O/l8m3ATDg0lpwP+LdWw3PIL2Oo7j/osajOs2aBlh+6
         gS4HOs3nx2YT+WIXvckHc35hK3uAI84RgRaechcT/wEOcLH2DzcowDvWNTiqJIvmRT4W
         l0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=XAiAnlHmkO+0jIPS0nCrMqFBgMcioHrpGQSObqqyeas=;
        b=X0kBWHGzwgqE4owcRgJv2COG5kkTVHLPdrS7RgqboKPju6NkcwibmPlnDuPEff/VVR
         D5Bmd4AtlGEQNIGl4sWovvrl6Q2hZsrFuaBI+IT/YrIKLWMIWsJMawrjNdKJgApCw6Yv
         MBU5XKNlVvZArRzGn5wcq1NDU9fh25p4XvYu10KBHkl4+JBLyP/AMGWHWRPQEQm/W+LA
         VlmmPmx5YNwqN5/PK/9wJEQkh1b3H8F1f8+9t7CGC25oTJIG+kclNmC5aZqsr+Ts6e3A
         n1wxAftv6tVw5IispzGLPw+flfaqUwihwMZRL4AH3USCnYq3YpTG4ZT5B7ovbmibwQbi
         PCTw==
X-Gm-Message-State: APjAAAWVaK6h4VJ9Mc3aVqIhZl89MEB5koSONQu4eMWb0VlxEKlcYlco
        TS7ZKtaHFTwGeeEmiE293hGYGA==
X-Google-Smtp-Source: APXvYqwGcLBdZK3nU6pGDNftkfkgJPgtpG1aXGPnvYkUGNtX/j6WJIJu/+V0scfWhhEsSLdQ4n5dfw==
X-Received: by 2002:aed:27c9:: with SMTP id m9mr23137596qtg.322.1566259664507;
        Mon, 19 Aug 2019 17:07:44 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id a23sm1283772qtj.5.2019.08.19.17.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 17:07:44 -0700 (PDT)
Date:   Mon, 19 Aug 2019 17:07:35 -0700
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
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 12/17] net: sgi: ioc3-eth: use dma-direct for dma
 allocations
Message-ID: <20190819170735.13884ec9@cakuba.netronome.com>
In-Reply-To: <20190819163144.3478-13-tbogendoerfer@suse.de>
References: <20190819163144.3478-1-tbogendoerfer@suse.de>
        <20190819163144.3478-13-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Aug 2019 18:31:35 +0200, Thomas Bogendoerfer wrote:
> @@ -1386,18 +1427,24 @@ static netdev_tx_t ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  		unsigned long b2 = (data | 0x3fffUL) + 1UL;
>  		unsigned long s1 = b2 - data;
>  		unsigned long s2 = data + len - b2;
> +		dma_addr_t d;
>  
>  		desc->cmd    = cpu_to_be32(len | ETXD_INTWHENDONE |
>  					   ETXD_B1V | ETXD_B2V | w0);
>  		desc->bufcnt = cpu_to_be32((s1 << ETXD_B1CNT_SHIFT) |
>  					   (s2 << ETXD_B2CNT_SHIFT));
> -		desc->p1     = cpu_to_be64(ioc3_map(skb->data, 1));
> -		desc->p2     = cpu_to_be64(ioc3_map((void *)b2, 1));
> +		d = dma_map_single(ip->dma_dev, skb->data, s1, DMA_TO_DEVICE);

You'll need to check the DMA address with dma_mapping_error(dev, addr),
otherwise static checkers will get upset.

> +		desc->p1     = cpu_to_be64(ioc3_map(d, PCI64_ATTR_PREF));
> +		d = dma_map_single(ip->dma_dev, (void *)b2, s1, DMA_TO_DEVICE);
> +		desc->p2     = cpu_to_be64(ioc3_map(d, PCI64_ATTR_PREF));
