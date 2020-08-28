Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A89A2562A2
	for <lists+linux-doc@lfdr.de>; Fri, 28 Aug 2020 23:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgH1VwR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Aug 2020 17:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgH1VwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Aug 2020 17:52:12 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EF6C061232
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 14:52:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 5so1060498pgl.4
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BGIFgHhnj4ZZ+ZwmJ+azPNOf9dZgEALfNMtI3CFWx/o=;
        b=iZovJBNhkq0B0uvt1ArnlCzdGbse3STj2vz7fm/5VWNq+S1otd+TvNXZEUISe40n4r
         3tyV7aZKRDpcO8Xj0Mrnb0RFV5xmg0I8ORIUjCNCrvsgPb0d8Bun/VjtpPNSc/dfVpKT
         uS0YwSrtAIaaZAeAitIxGI7YsF/TOi0NkB/2zD/YiJYxK4wMVhVW0mHTLZyrIXJPpESq
         y06pufjnDraLjjx8YNwTEqj440DVB6lkZF+ldjBz/N+O4Pc4nEPAthTnNQEdzYhkK/W3
         qIkdIyU503gGOvgOhAL7fG7yiYDGHx8m7RtnSdb1qBuDmi3Q35PlKpNHYR+hXjomtOgO
         +BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGIFgHhnj4ZZ+ZwmJ+azPNOf9dZgEALfNMtI3CFWx/o=;
        b=lE9WWUUyCN+IEcpL3EH/3Q/domwzRc9lGhH9ObKwu9zeG78sOFFzkEPdeo5y4mgHk5
         oc3uROWg1THA9X1HY1pOEW8BOZGAt8kLBeMUVmYlVm1xtTIT60ppVdkA4M41Tx0ggoka
         4DAER+btWnOIgK8BSam7N8PjGPOWg9z4dZVS9TEIvqkOZ4+ZbQGHUcjkxN30kscfQNyr
         u0udrMtxPOChy/HHMZJ10g2Ok1NRs9oQ45LcK23wICCzbFUcOFWhPTmQs2OiEKvbe/J9
         Kr59eb6qzsI08BHV/o7l8GDdDastsC0M+lJV6YX4Qhw5xeXciVcel0VgC170MUSvO97c
         6FmA==
X-Gm-Message-State: AOAM530MkbNSZpLfzE2Musok2zUJCqXxHAAtJPna2FHMMsvH9yRtIrsc
        AHAQh2/FBJzCKNWlJAebg3Ws5g==
X-Google-Smtp-Source: ABdhPJwhZJvDd6XsVHxUj8a4OFtxbQPgRKloZkMgTlDj0buCsdSbeE00LtElOYuUed4PK8i3k/2dZA==
X-Received: by 2002:a62:5214:: with SMTP id g20mr821890pfb.168.1598651532034;
        Fri, 28 Aug 2020 14:52:12 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id r199sm400334pfc.98.2020.08.28.14.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 14:52:11 -0700 (PDT)
Date:   Fri, 28 Aug 2020 14:52:03 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Bart Groeneveld <avi@bartavi.nl>
Cc:     linux-kernel@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] net: Use standardized (IANA) local port range
Message-ID: <20200828145203.65395ad8@hermes.lan>
In-Reply-To: <20200828204447.32838-1-avi@bartavi.nl>
References: <20200828203959.32010-1-avi@bartavi.nl>
        <20200828204447.32838-1-avi@bartavi.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 28 Aug 2020 22:44:47 +0200
Bart Groeneveld <avi@bartavi.nl> wrote:

> IANA specifies User ports as 1024-49151,
> and Private ports (local/ephemeral/dynamic/w/e) as 49152-65535 [1].
> 
> This means Linux uses 32768-49151 'illegally'.
> This is not just a matter of following specifications:
> IANA actually assigns numbers in this range [1].
> 
> I understand that Linux uses 61000-65535 for masquarading/NAT [2],
> so I left the high value at 60999.
> This means the high value still does not follow the specification,
> but it also doesn't conflict with it.
> 
> This change will effectively halve the available ephemeral ports,
> increasing the risk of port exhaustion. But:
> a) I don't think that warrants ignoring standards.
> 	Consider for example setting up a (corporate) firewall blocking
> 	all unknown external services.
> 	It will only allow outgoing trafiic at port 80,443 and 49152-65535.
> 	A Linux computer behind such a firewall will not be able to connect
> 	to *any* external service *half of the time*.
> 	Of course, the firewall can be adjusted to also allow 32768-49151,
> 	but that allows computers to use some services against the policy.
> b) It is only an issue with more than 11848 *outgoing* connections.
> 	I think that is a niche case (I know, citation needed, but still).
> 	If someone finds themselves in such a niche case,
> 	they can still modify ip_local_port_range.
> 
> This patch keeps the low and high value at different parity,
> as to optimize port assignment [3].
> 
> [1]: https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.txt
> [2]: https://marc.info/?l=linux-kernel&m=117900026927289
> [3]: See for example commit 1580ab63fc9a03593072cc5656167a75c4f1d173 ("tcp/dccp: better use of ephemeral ports in connect()")
> 
> Signed-off-by: Bart Groeneveld <avi@bartavi.nl>

Changing the default range impacts existing users. Since Linux has been doing
this for so long, I don't think just because a standards body decided to reserve
some space is sufficient justification to do this.

