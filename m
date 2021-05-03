Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144CF37132E
	for <lists+linux-doc@lfdr.de>; Mon,  3 May 2021 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbhECJtx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 May 2021 05:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233143AbhECJtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 May 2021 05:49:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E6DC06174A
        for <linux-doc@vger.kernel.org>; Mon,  3 May 2021 02:48:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z13so7212194lft.1
        for <linux-doc@vger.kernel.org>; Mon, 03 May 2021 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
        b=L2Okofnh+nI4KG9D4jS3dPq7uMy7zX3MoaDNsLku2rv1p+JCuCycrUhGQh3bN4jLao
         Z2Tb+ZyHD6Z33j6r11oEs60V4DQX4UEaRNtVuh+dfkUofHMt34GzzhFIaiZxkBhTGXOK
         WolPbOJhWmGB3mhsuTtxXCtcXSXJ2Uz6A88uJD5/ANWNgGeSAKZOHFIAJ+AMqoqWg81l
         WsU5TSq3ktxz/R0cjDVvz47BrNsgljf96EO59UaOhnnunTQ0vRpmMHQeHkEmFeNTAJYn
         ut8PZdGMT+DOEEpC2A8g0Cg21jj7+3AWVikbjJtQgqXCEzDx/TPEs1Eb14TG1oOUEBV1
         sp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
        b=B+3l1h5LKawVGU1/hAE9gQOdiyfXZGArCjoZJdbf7oIP2U2+9MfC/o/Dqj2sD58rUP
         un8LAX7dqjF8XFQa+m86mBzoeo8LktM0bQ6C4QN+YLFc4p/AdVFP8nq5HnJqu9xqf/LX
         PDchqUIYYE9XMT0V08LhZ94GGbYKVdgOMTkRkRFBTRTO7uoPP4PQ9MJzRAcV+fKz+wAO
         5og8Q1hOdnGLxdb9+a7b4hOVkbCaiuWPNKdyV0gLow4KWCeGc/l4vPUUqI79CG2DHrg6
         Z/XHJ7EwXg4sZRCSAwFc6pQfwN/nyLCKSquOiYmWoj12P5JiORYZA3QVUJxELbgijWMY
         Z0Yw==
X-Gm-Message-State: AOAM530bZRHrRRv+g5ofMDa3/ZHJIyLiKGDhwMH9YAmzDR/k99C1SLZC
        ETNYIeYdxSbNFoBTnQ94AcGnoA==
X-Google-Smtp-Source: ABdhPJzhF/j+aryEsz1w0KLEzdyFZwzZ6xWzP9d/ftzoOA567IhOefWHg93LARjh8yYYNHONoC3+UQ==
X-Received: by 2002:ac2:532d:: with SMTP id f13mr5151750lfh.81.1620035337449;
        Mon, 03 May 2021 02:48:57 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n27sm1093460lfh.271.2021.05.03.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 02:48:56 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id D372F1025F5; Mon,  3 May 2021 12:49:00 +0300 (+03)
Date:   Mon, 3 May 2021 12:49:00 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503094900.idmjc4zbrxr5sn73@box.shutemov.name>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list.

Distrowatch does. I used it for checking. But you need to check it per
distro. For Debian it would be here:

https://distrowatch.com/table.php?distribution=debian

-- 
 Kirill A. Shutemov
