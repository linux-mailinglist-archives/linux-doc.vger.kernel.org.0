Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D3B7A1258
	for <lists+linux-doc@lfdr.de>; Fri, 15 Sep 2023 02:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjIOAdW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Sep 2023 20:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjIOAdW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 20:33:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0EF26B7
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 17:33:17 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so204640566b.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 17:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694737996; x=1695342796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvr3LUTPCnlzdeJGe9jKxP+vA9Fp/a5KVBNv/Iu61xg=;
        b=dPizM96qwGUo6ZwfI/O2/2F49Ck60Q1KeThW4F22LbZyWxuizHjiElHS8Liz1fFS1d
         TsbsNZJlblxaA/LVKE/pWh3jqWI891OgTNLOLhgAP0oBplv65JrFR3P2SRQhwmWePzFG
         d3LD4qT4VTGQNK74qcMuYA9mumqgoIEFMEGdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694737996; x=1695342796;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qvr3LUTPCnlzdeJGe9jKxP+vA9Fp/a5KVBNv/Iu61xg=;
        b=VVd9CdGbpAahvZ10Pe8OTdXGwGsnj5Yz/SDccCuW2IX7qpsDaWA0t1mlR6LW6GQNQ3
         8jbr9ZxoO6jV/qb7mdOFkWWStpZXG2DbOP9mqS/VncOAQgHUZQxAhszsz56MYU0SLSt/
         zgl1k3rv6Ng3Jsq0o0zGJ6SrBETTUSXQ+85QGdeFCi8+/vNYF14psgTSI5v+KwO4LOrf
         IwRblX2laErPmF+tpVG/XCGHCJ8+00ORW1S1BlqxZOg6acwnfjHUBu25KvdeLS98Se83
         cFAFO+vRaBX1s6kTrXNZu69aZ+Z817QmPzBXVlo7SifqnjB6jY+LI5Y7/4BZDqd6P9Xa
         oXmw==
X-Gm-Message-State: AOJu0YzOAsrMRB/AaGTiOLMLp3W74wAD/pKNQu/QBOtJ0PBo8tpbW9KR
        FajC9Z1d+BIRVZKu4Rp9QtjOJg==
X-Google-Smtp-Source: AGHT+IHViSUcArYmWr6MhrGopGlxIfnNZ7LWPvwSUNL0WVRYHkDsfzmJtBUWnPFw5fHbDPHMAHqaLQ==
X-Received: by 2002:a17:906:5392:b0:9a2:23b:db60 with SMTP id g18-20020a170906539200b009a2023bdb60mr16582ejo.54.1694737996072;
        Thu, 14 Sep 2023 17:33:16 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1657125ejc.124.2023.09.14.17.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 17:33:15 -0700 (PDT)
Message-ID: <50e96f85-66f8-2a4f-45c9-a685c757bb28@citrix.com>
Date:   Fri, 15 Sep 2023 01:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From:   andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To:     Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin3.li@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc:     mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, luto@kernel.org,
        pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com> <87v8cc1ehe.ffs@tglx>
In-Reply-To: <87v8cc1ehe.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 15/09/2023 1:12 am, Thomas Gleixner wrote:
> On Fri, Sep 15 2023 at 00:46, andrew wrote:
>> On 15/09/2023 12:00 am, Thomas Gleixner wrote:
>>> So no. I'm fundamentally disagreeing with your recommendation. The way
>>> forward is:
>>>
>>>   1) Provide the native variant for wrmsrns(), i.e. rename the proposed
>>>      wrmsrns() to native_wrmsr_ns() and have the X86_FEATURE_WRMSRNS
>>>      safety net as you pointed out.
>>>
>>>      That function can be used in code which is guaranteed to be not
>>>      affected by the PV_XXL madness.
>>>
>>>   2) Come up with a sensible solution for the PV_XXL horrorshow
>>>
>>>   3) Implement a sane general variant of wrmsr_ns() which handles
>>>      both X86_FEATURE_WRMSRNS and X86_MISFEATURE_PV_XXL
>>>
>>>   4) Convert other code which benefits from the non-serializing variant
>>>      to wrmsr_ns()
>> Well - point 1 is mostly work that needs reverting as part of completing
>> point 3, and point 2 clearly needs doing irrespective of anything else.
> No. #1 has a value on its own independent of the general variant in #3.
>
>>>      That function can be used in code which is guaranteed to be not
>>>      affected by the PV_XXL madness.
> That makes a lot of sense because it's guaranteed to generate better
> code than whatever we come up with for the PV_XXL nonsense.

It's an assumption about what "definitely won't" be paravirt in the future.

XenPV stack handling is almost-FRED-like and has been for the better
part of two decades.

You frequently complain that there's too much black magic holding XenPV
together.  A paravirt-FRED will reduce the differences vs native
substantially.

~Andrew
