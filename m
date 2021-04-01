Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A093512CD
	for <lists+linux-doc@lfdr.de>; Thu,  1 Apr 2021 11:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbhDAJyz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Apr 2021 05:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36748 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233863AbhDAJyz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 05:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617270894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fAdGMUfthRpMVWvxY4RMBaKTOwqFcFl3/AUFTNmxbfg=;
        b=OnSu0FQJiyGB1YY5qfcSx3v5sTvVoPBskAeVV89nMT3V8Sr59DSj79C8jJel+DXg6Hs3RT
        KzUXfvlmB2DO7DGT0llszXH47w1ZpqrYLTBAyIK3ExHOqjKN1pNNcfzNAsx3bDcyJ2wcTg
        BWBeLpD6llX18Q+Md1AULhQyx8Xppe0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-c5sKj0FmNs2lO2ZQ6xVI1A-1; Thu, 01 Apr 2021 05:54:52 -0400
X-MC-Unique: c5sKj0FmNs2lO2ZQ6xVI1A-1
Received: by mail-ej1-f71.google.com with SMTP id bn26so1987038ejb.20
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 02:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAdGMUfthRpMVWvxY4RMBaKTOwqFcFl3/AUFTNmxbfg=;
        b=pMXLAd7qeoqfVLiWsKhyszTwiEnKTD5RqZZxldVA1xioSz/hTKWqMdKxzQz2hof4Z/
         aOnAw201BmP4RUVl9Ymb7GKKkAsO27kKSfeYhY1F/9rxEkOVaLAkhvneomGUIGzGH6+m
         eP4a8soDUDUl3aNBKQr/uCeAMjLt6w/60bbe/fMky9HqcgSh16lb2bz3C67mvFCWj5Hu
         JbIDL+u4SG2tOuhGyqCT0RPLLDD5/CBWuxf5vNwA6WmhGm9gSPfjpGUNhXYB7FBnfD2U
         YabpfrNmQgqVTYY8DOkxUkciksdl1KGnntZ5O3Y4IBMqj09A/96RWiO6/EFePzM/c84I
         EakA==
X-Gm-Message-State: AOAM533Ejhhe0wNRpLgGta1AV2kYTPTf3jqX6IF+KbdyHw5+KwC34EUe
        qnjoLvLqdRedcNukLy7q8aAiJnlzYZ5WR+XL1KR2v0u332Gg1wbu712s0NZfSD12wd94nhwvMoX
        P+xKg6TMQMXmQruhJYvIH
X-Received: by 2002:aa7:d448:: with SMTP id q8mr8881504edr.345.1617270891469;
        Thu, 01 Apr 2021 02:54:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcJn03CNAPp/Sc8OCcDq5D5Q0Jg/yleVzKc9A/ZpGvLXsjmE9GpW+q69DSUVA81YUWRWkDGw==
X-Received: by 2002:aa7:d448:: with SMTP id q8mr8881482edr.345.1617270891357;
        Thu, 01 Apr 2021 02:54:51 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.195])
        by smtp.gmail.com with ESMTPSA id rs24sm2507513ejb.75.2021.04.01.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 02:54:50 -0700 (PDT)
Subject: Re: [PATCH 4/4] selftests: kvm: add get_emulated_cpuid test
To:     Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Jim Mattson <jmattson@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20210330185841.44792-1-eesposit@redhat.com>
 <20210330185841.44792-5-eesposit@redhat.com>
 <87k0pms6no.fsf@vitty.brq.redhat.com>
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1b274a70-e98a-41b2-93ec-537a2315619e@redhat.com>
Date:   Thu, 1 Apr 2021 11:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0pms6no.fsf@vitty.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


>> +static void check_cpuid(struct kvm_cpuid2 *cpuid, struct kvm_cpuid_entry2 *entrie)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < cpuid->nent; i++) {
>> +		if (cpuid->entries[i].function == entrie->function &&
>> +		    cpuid->entries[i].index == entrie->index) {
>> +			if (is_cpuid_mangled(entrie))
>> +				return;
>> +
>> +			TEST_ASSERT(cpuid->entries[i].eax == entrie->eax &&
>> +				    cpuid->entries[i].ebx == entrie->ebx &&
>> +				    cpuid->entries[i].ecx == entrie->ecx &&
>> +				    cpuid->entries[i].edx == entrie->edx,
>> +				    "CPUID 0x%x.%x differ: 0x%x:0x%x:0x%x:0x%x vs 0x%x:0x%x:0x%x:0x%x",
>> +				    entrie->function, entrie->index,
>> +				    cpuid->entries[i].eax, cpuid->entries[i].ebx,
>> +				    cpuid->entries[i].ecx, cpuid->entries[i].edx,
>> +				    entrie->eax, entrie->ebx, entrie->ecx, entrie->edx);
>> +			return;
>> +		}
>> +	}
>> +
>> +	TEST_ASSERT(false, "CPUID 0x%x.%x not found", entrie->function, entrie->index);
>> +}
>> +
>> +static void compare_cpuids(struct kvm_cpuid2 *cpuid1,
>> +						   struct kvm_cpuid2 *cpuid2)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < cpuid1->nent; i++)
>> +		check_cpuid(cpuid2, &cpuid1->entries[i]);
>> +
>> +	for (i = 0; i < cpuid2->nent; i++)
>> +		check_cpuid(cpuid1, &cpuid2->entries[i]);
>> +}
> 
> CPUID comparison here seems to be borrowed from get_cpuid_test.c, I
> think we can either put it to a library or (my preference) just merge
> these two selftests together. 'get_cpuid_test' name is generic enough to
> be used for KVM_GET_EMULATED_CPUID too.

Yes it is identical. I agree with you, I will merge the test in 
get_cpuid_test.c

Emanuele

