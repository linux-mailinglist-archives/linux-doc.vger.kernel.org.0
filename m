Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC44A3979CB
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 20:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhFASMr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Jun 2021 14:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhFASMq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 14:12:46 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1053BC061756
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 11:11:05 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id j184so15235572qkd.6
        for <linux-doc@vger.kernel.org>; Tue, 01 Jun 2021 11:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=wRwteCaGKZ10e8+sBtL3qGET4PztXqRbJxpQswQ1wZ4=;
        b=Xf7CSrcx0gZc/sw/u32fm4fDbUmIKsXJ/VYY3b6I2TINji/gEViOo0+/3eu+yW9Qgd
         fIGeNKOgrvvoXSlKowbNVeKQqeYrgIx8R+UG5xh83h5SLOwv/5uFjJDNSoddC30OLOAP
         eeb77BNO0SGqOxoLj3XL020OBNHpc15BDfmueLRDjJQfWJptI6v5o1b1rHvOJRAOVKlt
         VNpNaJpcQ4vHbnLaPIFMaxp4PkgtqZM58T+bwUwvwAp24ndzjiN27Y317PjL5UaZhW2A
         4MHWVeTTB4dK7LEaSj2Ky8gxJUKpLuudM6imShkOBqj5RMusHaTKIjTFUXCuCa94uHDl
         W5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=wRwteCaGKZ10e8+sBtL3qGET4PztXqRbJxpQswQ1wZ4=;
        b=fPI6rNeTHgwpFN8UuHxRWCDQI1SQEcuwL1K5eYx65V5W4z/sWsVqiARuDt0CIaA7HQ
         OJFlxKYR7YIJ3nki8XGk6QGIF5T3ZeRcMTybpYsL6MtFMfdMaho+NWMFS/bjzQdcEL7u
         UuM7oj1wyKKauidQ+3lAtyVfRQ4IhlFVa0bd0+SWd5v6Kul/Es2ZlYWjmoj50hUX9abi
         Z+/NrRunP8LwidbeZyKL7axRUvDbXcfO2UyiWjeTQ7Eck2QTc8j596XgwaqvCWPdz0fK
         HRMUPeZaVcGkyQhPVRl1NJuQnC7yvdEZFtkkDJKDySJF3W57cKfGEVPJaDXItn60knh0
         R1wg==
X-Gm-Message-State: AOAM533fhFbmBOW1XcKpAuv/cs7Sx0b/jir/C3WbzIADId8N49UMTqiq
        r1wkptQ0SGWQ3feFWxscbeYu+A==
X-Google-Smtp-Source: ABdhPJyH06WMNFVFIh2tqA2mZ/X7OLcXSDF3vAAIrUB8u/TcRWHA6zy5sI+bX9Bd1/r6Bup6LtlwYg==
X-Received: by 2002:a37:91c2:: with SMTP id t185mr23666624qkd.430.1622571063443;
        Tue, 01 Jun 2021 11:11:03 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g5sm10470430qtv.56.2021.06.01.11.11.01
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 01 Jun 2021 11:11:03 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:10:49 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Mike Rapoport <rppt@kernel.org>
cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Andy Shevchenko <andy@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Dave Young <dyoung@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Lianbo Jiang <lijiang@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/3] x86/setup: always resrve the first 1M of RAM
In-Reply-To: <20210601075354.5149-1-rppt@kernel.org>
Message-ID: <alpine.LSU.2.11.2106011109020.1045@eggly.anvils>
References: <20210601075354.5149-1-rppt@kernel.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 1 Jun 2021, Mike Rapoport wrote:
> 
> Randy, Hugh, I'd appreciate if you give this a whirl on your old Sandy
> Bridge laptops as it changes again the way trim_snb_memory() works.

Boots and runs fine here, i386 or x86_64: thanks for remembering us!

Hugh
