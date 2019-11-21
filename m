Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B0A10562F
	for <lists+linux-doc@lfdr.de>; Thu, 21 Nov 2019 16:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfKUP4S (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Nov 2019 10:56:18 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36384 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfKUP4R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Nov 2019 10:56:17 -0500
Received: by mail-il1-f194.google.com with SMTP id s75so3776168ilc.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2019 07:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i6XZTTQSHJKM+KBZCHJbpNr3leYiOU/zZyc4Kt/q1ls=;
        b=p9f61F2qEE4/QwqhzVpQxRpsxX+tV3SxRebeynsmRfBNHvoMnRcPAeQBMJ4vetLpDz
         shfSAjNsSLR8/AyOjsQjN2cfgMUQmKjudar8cuqkQT4utDF/Fg0xyKUILGxfQL2m4ykC
         v2dKDPfCeTVXelv8ErH8wWKv+orr2ysEDzISJsEE+qs4wfsyfactwDmLH8MnBWJzVSmY
         XCTDegH0huTSluHvW6LcnV5C2iycu99pwuw2Q/YxucMfTo227eo59/I8ZMNVpzMswrI3
         2Efr4431bVIGY+4pWPJ+b3TiJoIazJewBg9vmPs5YlVPxg8N869vnJ+tezxnZ3CO4XTi
         5d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i6XZTTQSHJKM+KBZCHJbpNr3leYiOU/zZyc4Kt/q1ls=;
        b=Lk91CHa/fDgSePD6/XFb6SHZb2IbIMr5xI1bRSPVjms7tcQlQjDxa0fYVExHyrZquG
         xXbxHi+Q0Vcqz2gBrLY2BUAZdxpnLsb8KUv8CWB0Pbs31is1gVNLiJKcEIL9F1rRxr5H
         ACjYkmUkGCpnS0yWe0aSgs3n6D0pSIL3mvn5JtZmRJxVp7EjGpGHXv7PuFBfla9i3mbw
         UdypyJeO58Ai3gbIebGuBYv/WYlWtXacDswR6AHGC4Eshy6XP74BqwK0Uxv8tP0/odca
         edX3c9WmBEsBYArgGafPwHDnirZXtQcYDU4IYHIspP+Ek9cNQ5o5JKdkrHG4EcJrKq2p
         in4Q==
X-Gm-Message-State: APjAAAU4hXUWTykuB//VAyeefgDmlqV85uC0A7o997n2G2OVgQ+1MtFj
        keVjXhlY97Tzp5DuvHUWIpOKag==
X-Google-Smtp-Source: APXvYqyBx1nTqGMRn9GsWSj0/giOcMCoKn/OjZ4stbz+xyyRba03IeYJrruyiFFcHRXe1jGKDNx4oA==
X-Received: by 2002:a05:6e02:100b:: with SMTP id n11mr10655778ilj.212.1574351776819;
        Thu, 21 Nov 2019 07:56:16 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 133sm1342001ila.25.2019.11.21.07.56.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 07:56:15 -0800 (PST)
Subject: Re: [PATCH] block: add iostat counters for flush requests
To:     Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        Dmitry Monakhov <dmtrmonakhov@yandex-team.ru>
References: <157433282607.7928.5202409984272248322.stgit@buzz>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <ff971ff6-9a10-c3f1-107d-4f7d378e8755@kernel.dk>
Date:   Thu, 21 Nov 2019 08:56:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <157433282607.7928.5202409984272248322.stgit@buzz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/21/19 3:40 AM, Konstantin Khlebnikov wrote:
> Requests that triggers flushing volatile writeback cache to disk (barriers)
> have significant effect to overall performance.
> 
> Block layer has sophisticated engine for combining several flush requests
> into one. But there is no statistics for actual flushes executed by disk.
> Requests which trigger flushes usually are barriers - zero-size writes.
> 
> This patch adds two iostat counters into /sys/class/block/$dev/stat and
> /proc/diskstats - count of completed flush requests and their total time.

This makes sense to me, and the "recent" discard addition already proved
that we're fine extending with more fields. Unless folks object, I'd be
happy to queue this up for 5.5.

-- 
Jens Axboe

