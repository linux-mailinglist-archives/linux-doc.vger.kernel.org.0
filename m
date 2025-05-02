Return-Path: <linux-doc+bounces-45063-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB0AA67AF
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 02:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001833B95D7
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 00:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AC633C9;
	Fri,  2 May 2025 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXbInH+R"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F2801
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746144935; cv=none; b=WsTON7EPsIsN8WP7rIYQ5GquBOMAKM1iJgcYTYBbz5/GKwDRa60jMBfPkC9yETmvpq/qWTUX1Ll98635SHFAC5ZflHQnfYT/PZbGagRCLArwfOivZDOMHKG0B0BF1/Bjavxsd1SToyan4eIAOTDwFw6RCR61j75rpiY76+MC358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746144935; c=relaxed/simple;
	bh=Hu9uey6Pa0D+z+erSEtVapskvsnht62al90pnI1d3to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDMrbct6jOH81KmrJymSC9c5KMHxfSwQWdFTxJYiOpB23yJvrLRhyh8/NWyomS0sdOuXhXZ1tJH3H+FQJglabclHWpqdpXpDtjII0mLl0tg/pFihOK0n6dAh5h+LPqtcQk60TemyUZQojPc//DGiN+iw7Q2IWZr/kuvPmMLDE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXbInH+R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746144931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbSujQdzOlpgDul9aKhNv07DzuPDK3kC7rOVdyX4Q9k=;
	b=YXbInH+RRnF5dinjViyFw4MJ57K8GjghdZ7Wnce54bK9HXiYESohWyxnuAdrtc6CoTcOIv
	zIdqq5ICGmbpl8gK6tr4lhCyqiQzBzPm9M88uZndyP0n524B+WNTt/FuqdbntKP7zKQjoU
	iegLnMeC1QgQpirfavZOMpXjGclvNws=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-Hcl0SlNROuKXx3UxPJqvvQ-1; Thu, 01 May 2025 20:15:29 -0400
X-MC-Unique: Hcl0SlNROuKXx3UxPJqvvQ-1
X-Mimecast-MFC-AGG-ID: Hcl0SlNROuKXx3UxPJqvvQ_1746144929
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cb72efd5so1329385b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 17:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746144928; x=1746749728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbSujQdzOlpgDul9aKhNv07DzuPDK3kC7rOVdyX4Q9k=;
        b=giQRrIIdR+GqoaaJeaXywS10rGOz+wlBq8Tq2ceQjQt0FAFB09l7RmExZY+yR9FPBc
         wwud0vhf/Afrp2wpAv/r5KIl7aujUvYb/RoHjTCj4fsPHiqgvSh1TxjApOhumhWBafYT
         iv8Lz2IPlEWM/Yq6k7iPbZIsPgRv5pvQvmyunBFiEOqNKJW0x30sVkU8yx4boQkrzD/W
         P6GmE9dH+BDrmU3EO7C9+AgdI8hg+22SOTCevJtOVmZnDNTuU8HzjKy4vjUrJFna5VUz
         6pH7hvLfKv32EXcag1m7/gJuYGxiZAd0EQCefagy6JcmnynKrQrodfTX3o5ZtBPNaxmA
         nBqA==
X-Forwarded-Encrypted: i=1; AJvYcCXEAl81LIYahiNYbLPqX7ySZ0smWjqPFEe2ySPxBPH4oJ0ATCiejTLRXE4FLJGvlYXQa1+/sj5YCGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzujJtHcdvvQEvQhQCHo7bmAkZJYfNeEkTjUKr0kRhTN+XJz/eA
	KVS7YBHVNFz2Lm1RLH8iNkEduDTZogJbpJEzQs8+5Wiuskmxwo8QfaUK2+AXoglqZueWCxl0iqq
	PUN/8jte3a6V3FswvQk8X5Ut5gCNXC/trT2wPott48jdKhTUfXKS2KrPJHIz+Ubt3BOnTyT4=
X-Gm-Gg: ASbGncvfMz2XKsuFVl9itM/0AreG7/2MhwW9IvwMNed5vieGzUoYF2t6RMy+ndBzRXp
	4hhLaaLjF8B6s8tpaAeuQGTvrL30WzTGzHlBCcn3kolyn13T3DqwGkIYAUyoy+Cx6eZ/4y8N9xw
	9HxC0xE3gi1BUdN5ZVsXd6f6gBpydEarWRgefd5+mH2gh781fA6W/t7bNwGLBSIqA+Iyley3v84
	+CO6sgWqj8lJHTr6TBpN199ul0bh3Rm1KBysPtzfKja+60vpLYK1xZ5QH0HfSQSj/Gc/DlPv+ik
	OyY=
X-Received: by 2002:a05:6a00:4482:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-74058b5afa8mr1174959b3a.23.1746144928243;
        Thu, 01 May 2025 17:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy4Y5HHdUqHKiUz0kaMhKXY0SFHVwDyaNMwEA6Af6JnFYU50R/5oUIym3PoOTyiAHn9eWf0g==
X-Received: by 2002:a05:6a00:4482:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-74058b5afa8mr1174908b3a.23.1746144927790;
        Thu, 01 May 2025 17:15:27 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405902154dsm294793b3a.90.2025.05.01.17.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 17:15:27 -0700 (PDT)
Date: Fri, 2 May 2025 08:13:03 +0800
From: Coiby Xu <coxu@redhat.com>
To: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 6/7] x86/crash: pass dm crypt keys to kdump kernel
Message-ID: <q3673nazd6gsblq7ifcdwr2qcn7d6khxfk4cxpznmbhdnyyqum@o6i7udo5e7uu>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-7-coxu@redhat.com>
 <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>
 <rwetpbjimryr7g7xmdmaeuwkdasyqdpejsy4sdee3kzlssm32s@5xnznwqa3ivm>
 <c2mqpzhtyrd5qzove5pa44ob2iiwdcrtnj655sozy2a4pprln7@mql5bjuwjbxs>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c2mqpzhtyrd5qzove5pa44ob2iiwdcrtnj655sozy2a4pprln7@mql5bjuwjbxs>

On Wed, Apr 30, 2025 at 04:48:25PM +0200, Arnaud Lefebvre wrote:
>On Tue, Apr 29, 2025 at 05:40:21PM +0800, Coiby Xu wrote:
>>On Wed, Apr 23, 2025 at 10:59:06PM +0200, Arnaud Lefebvre wrote:
>>>>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>>>>index 68530fad05f7..5604a5109858 100644
>>>>--- a/arch/x86/kernel/kexec-bzimage64.c
>>>>+++ b/arch/x86/kernel/kexec-bzimage64.c
>>>>@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
>>>>	if (image->type == KEXEC_TYPE_CRASH) {
>>>>		len = sprintf(cmdline_ptr,
>>>>			"elfcorehdr=0x%lx ", image->elf_load_addr);
>>>>+
>>>>+		if (image->dm_crypt_keys_addr != 0)
>>>>+			len += sprintf(cmdline_ptr + len,
>>>>+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
>>
>>sprintf will return the length of dmcryptkey=xxx which will be added to
>>len.
>>
>>>>	}
>>>>	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
>>>>	cmdline_len += len;
>>
>>Then cmdline_len will included the new len.
>
>Yes, the cmdline_len is correct. No issue there.

Thanks for confirming it!

>
>>
>>>
>>>You are adding another kernel parameter but I believe without taking its
>>>length into account. See the MAX_ELFCOREHDR_STR_LEN constant which is added to the
>>>params_cmdline_sz variable for the elfcorehdr= parameter.
>>
>>Thanks for raising the concern! I believe this issue has already been
>>took care of. Please check the above two inline comments:)
>>
>
>I'm sorry but I don't think it is. If you look at my comments below:
>
>>
>>>
>>>This will (at least during my tests) truncate the cmdline given to the crash kernel because
>>>the next section (efi_map_offset) will have an offset starting inside the cmdline section
>>>and it might overwrite the end of it:
>>>
>>>kexec-bzimage64.c:480:
>>>params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
>>>			MAX_ELFCOREHDR_STR_LEN; <<< Should have + 31 here for "dmcryptkeys=0x<ptr> "
>>>params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
>>>kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
>>>			sizeof(struct setup_data) +
>>>			sizeof(struct efi_setup_data) +
>>>			sizeof(struct setup_data) +
>>>			RNG_SEED_LENGTH;
>>>
>>>And I believe the buffer might be too small.
>>>
>>>Also, there is another check a few lines above that needs to take the size into account:
>>>
>>>/*
>>>* In case of crash dump, we will append elfcorehdr=<addr> to
>>>* command line. Make sure it does not overflow
>>>*/
>>>if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
>>>	pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
>>>	return ERR_PTR(-EINVAL);
>>>}
>>>
>>
>
>To try to explain a bit more, we pass a lot of arguments to the crash kernel so
>the initrd (dracut) can mount the encrypted disk. When I run kexec using
>the following:
>
>/usr/host/bin/kexec --debug --load-panic /linux-hv '--append=maxcpus=1
>reset_devices rd.info rd.cc.kdump root=UUID=d039277c-2ee
>3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10 rd.shell=1
>rd.cc.kdump.encrypted
>rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
>rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447' --initrd
>/crash-initrd
>
>kexec debug print those logs:
>
><snip>
>[   53.642483] kexec-bzImage64: Loaded purgatory at 0xb6ffb000
>[   53.642828] kexec-bzImage64: Loaded boot_param, command line and misc at
>0xb6ff9000 bufsz=0x12f0 memsz=0x2000
>[   53.643366] kexec-bzImage64: Loaded 64bit kernel at 0xb1000000
>bufsz=0x16a5000 memsz=0x550d000
>[   53.643918] kexec-bzImage64: Loaded initrd at 0xaeb90000 bufsz=0x246f2a1
>memsz=0x246f2a1
>[   53.644363] kexec-bzImage64: Final command line is: elfcorehdr=0x77000000
>dmcryptkeys=0xa81fc000 maxcpus=1 reset_devices rd.info rd.cc.kdump
>root=UUID=d039277c-2ee3-466a-85eb-db9524398135  console=ttyS0 rd.timeout=10
>rd.shell=1 rd.cc.kdump.encrypted
>rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
>rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447
><snip>
>
>Here, we see the full command line, as expected. But when I trigger a panic
>using `echo c > /proc/sysrq-trigger`, the first two lines of the crash kernel
>loading are:
>
>[    0.000000] Linux version 6.12.23+ (arnaud@exherbo) (gcc (GCC) 12.3.0, GNU ld
>(GNU Binutils) 2.44) #4 SMP Wed Apr 30 16:11:39 CEST 2025
>[    0.000000] Command line: elfcorehdr=0x77000000 dmcryptkeys=0x9ec14000
>maxcpus=1 reset_devices rd.info rd.cc.kdump
>root=UUID=d039277c-2ee3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10
>rd.shell=1 rd.cc.kdump.encrypted
>rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
>rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c26090
>
>You can see some of it is truncated at the end. It's missing `7a2447`. This is
>because I guess it gets overridden.
>
>My comment above explains where and why it might happen. If I add the size of
>the dmcryptkeys string length to the params_cmdline_sz variable, we should
>allocate enough space to have it all. With the patch below, it works fine and I
>get the full cmdline when my crash kernel boots:
>
>[    0.000000] Linux version 6.12.23+ (arnaud@exherbo) (gcc (GCC) 12.3.0, GNU ld
>(GNU Binutils) 2.44) #3 SMP Thu Apr 24 16:42:18 CEST 2025
>[    0.000000] Command line: elfcorehdr=0x77000000 dmcryptkeys=0xa81fc000
>maxcpus=1 reset_devices rd.info rd.cc.kdump
>root=UUID=d039277c-2ee3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10
>rd.shell=1 rd.cc.kdump.encrypted
>rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
>rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447
>
>
>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>index 5604a5109858..06fc1f412af4 100644
>--- a/arch/x86/kernel/kexec-bzimage64.c
>+++ b/arch/x86/kernel/kexec-bzimage64.c
>@@ -27,6 +27,7 @@
> #include <asm/kexec-bzimage64.h>
> #define MAX_ELFCOREHDR_STR_LEN	30	/* elfcorehdr=0x<64bit-value> */
>+#define MAX_DMCRYPTKEYS_STR_LEN 31
> /*
>  * Defines lowest physical address for various segments. Not sure where
>@@ -434,7 +435,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
> 	 * In case of crash dump, we will append elfcorehdr=<addr> to
> 	 * command line. Make sure it does not overflow
> 	 */
>-	if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
>+	if (cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN > header->cmdline_size) {
> 		pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
> 		return ERR_PTR(-EINVAL);
> 	}
>@@ -478,7 +479,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
> 	 */
> 	efi_map_sz = efi_get_runtime_map_size();
> 	params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
>-				MAX_ELFCOREHDR_STR_LEN;
>+				MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN;
> 	params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
> 	kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
> 				sizeof(struct setup_data) +
>
>
>Let me know if it makes more sense!

Yes, thanks for providing a crystal clear explanation and also a fix! I
appreciate your elaboration to show me what the problem is! I'll fix it
in v9.

-- 
Best regards,
Coiby


