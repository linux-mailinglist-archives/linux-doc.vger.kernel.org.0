Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE11A4358CC
	for <lists+linux-doc@lfdr.de>; Thu, 21 Oct 2021 05:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhJUDIP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Oct 2021 23:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhJUDIO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 23:08:14 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA5BC061749
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 20:05:59 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id n8-20020a17090a2bc800b00196286963b9so2049221pje.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 20:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GHlCsQKA6ANrCmV8EAVd8kSzy36VnW2q1AuqAqPG6C0=;
        b=eeSEbPXnojW9ytHGkh3hy9RzO5u0Q0bchANyGqPTc4oajy1Ah9Jw3D3z2f7Ziv3INN
         3BV1SIcQScjzE+ruRGgZGjMoEWUd/E1nYo1qwcgzdUSQEnzJwtvqop4bnLb3h+ECE8pV
         uktoihN+C54gFvW2EH0/HDiO6355KKkE18mdsPgCMOrJait1mW6IvFJS+Dt7SofWqmD/
         xb1huHZnlKoSTR5+pRcH6CBEIEkyOk4u2fXy2kOc6def57d+yWN/7Gx+m6Uhj+VJ3tD7
         4irdoJBk91/7hFtyK5am7neKkV1VkNZrCSvd8KbQqG6rDeDFbdkUVnsQkRgSrifVczrf
         kfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GHlCsQKA6ANrCmV8EAVd8kSzy36VnW2q1AuqAqPG6C0=;
        b=BBWLwWnh5at3bj65YV8OtxegsHXxwQsH8ogTTRqJmGfaZXQE5QitArEuomsq/gs0wv
         lHejgpjVgE0o3wquvigav3PqRUQ0G5gMlSFBUMI95HW0wkoroevBYkZ9qzkKapY7m/BA
         gQlhHty+O4yMzei3IwrZBmoIJmIItyAi6CwpixjQyelLF4BDoeRYOKGPXyzah0/TNMfF
         roIRUc4QxUNYpzpQtxqI9bRi1wgshc6dAfVgdkasZu5kQCID3RjqXt+yUIwj/LUT94Vt
         5lNGra2e9rSPcC4y+5r905COsf10NZBPPdJerPbbvnLvyG69OBNKlZ8vbcF9cKPoUoAw
         9oOg==
X-Gm-Message-State: AOAM531XI0XvBgbA2xTObHMH/OsrRjI5zdpb8IgHWDPjYC4X+hmFRFaz
        9Hiyy7C6rpY2D+bKTMlGeRJIrNGC1U8=
X-Google-Smtp-Source: ABdhPJxf82HF6CwlXS3DZSINuO3hhhyHQRWNXAxz2GBbAKJw8ZU5mZcbUJbc6rq9fX62zgROnXXL0w==
X-Received: by 2002:a17:90b:17d2:: with SMTP id me18mr3249244pjb.98.1634785558244;
        Wed, 20 Oct 2021 20:05:58 -0700 (PDT)
Received: from [10.2.24.177] ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id l1sm3605910pgt.39.2021.10.20.20.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 20:05:57 -0700 (PDT)
Subject: Re: Re: [PATCH] x86/kvm: Introduce boot parameter no-kvm-pvipi
To:     Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <kernellwp@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
References: <20211020120726.4022086-1-pizhenwei@bytedance.com>
 <CANRm+CxAVA-L0wjm72eohXXWvh9fS7wVFzfKHuEjrsiRFuk9fg@mail.gmail.com>
 <YXB4FHfzh99707EH@google.com>
From:   zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <08757159-1673-5c7b-3efc-e5b54e82d6c3@bytedance.com>
Date:   Thu, 21 Oct 2021 11:02:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXB4FHfzh99707EH@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/21 4:12 AM, Sean Christopherson wrote:
> On Wed, Oct 20, 2021, Wanpeng Li wrote:
>> On Wed, 20 Oct 2021 at 20:08, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>>
>>> Although host side exposes KVM PV SEND IPI feature to guest side,
>>> guest should still have a chance to disable it.
>>>
>>> A typicall case of this parameter:
>>> If the host AMD server enables AVIC feature, the flat mode of APIC
>>> get better performance in the guest.
>>
>> Hmm, I didn't find enough valuable information in your posting. We
>> observe AMD a lot before.
>> https://lore.kernel.org/all/CANRm+Cx597FNRUCyVz1D=B6Vs2GX3Sw57X7Muk+yMpi_hb+v1w@mail.gmail.com/T/#u
> 
> I too would like to see numbers.  I suspect the answer is going to be that
> AVIC performs poorly in CPU overcommit scenarios because of the cost of managing
> the tables and handling "failed delivery" exits, but that AVIC does quite well
> when vCPUs are pinned 1:1 and IPIs rarely require an exit to the host.
> 

Test env:
CPU: AMD EPYC 7642 48-Core Processor

Kmod args(enable avic and disable nested):
modprobe kvm-amd nested=0 avic=1 npt=1

QEMU args(disable x2apic):
... -cpu host,x2apic=off ...

Benchmark tool:
https://github.com/bytedance/kvm-utils/tree/master/microbenchmark/apic-ipi

~# insmod apic_ipi.ko options=5 && dmesg -c

  apic_ipi: 1 NUMA node(s)
  apic_ipi: apic [flat]
  apic_ipi: apic->send_IPI[default_send_IPI_single+0x0/0x40]
  apic_ipi: apic->send_IPI_mask[kvm_send_ipi_mask+0x0/0x10]
  apic_ipi: 	IPI[kvm_send_ipi_mask] from CPU[0] to CPU[1]
  apic_ipi:		total cycles 375671259, avg 3756
  apic_ipi: 	IPI[flat_send_IPI_mask] from CPU[0] to CPU[1]
  apic_ipi:		total cycles 221961822, avg 2219


apic->send_IPI_mask[kvm_send_ipi_mask+0x0/0x10]
   -> This line show current send_IPI_mask is kvm_send_ipi_mask(because 
of PV SEND IPI FEATURE)

apic_ipi: 	IPI[kvm_send_ipi_mask] from CPU[0] to CPU[1]
apic_ipi:		total cycles 375671259, avg 3756
   -->These lines show the average cycles of each kvm_send_ipi_mask: 3756

apic_ipi: 	IPI[flat_send_IPI_mask] from CPU[0] to CPU[1]
apic_ipi:		total cycles 221961822, avg 2219
   -->These lines show the average cycles of each flat_send_IPI_mask: 2219


-- 
zhenwei pi
