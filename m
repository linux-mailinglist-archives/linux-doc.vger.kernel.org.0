Return-Path: <linux-doc+bounces-15234-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DF8B4413
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 06:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675CC1C213E5
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 04:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698B23CF7E;
	Sat, 27 Apr 2024 04:25:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822313CF73;
	Sat, 27 Apr 2024 04:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714191949; cv=none; b=Jr1LXEUAyvXt2zM5vhJ+riY8JvHvONrjgebSdfsoBXHFOZeCS6AnxPJjNnlLMav5JBv8wct7ZpHtoLpHAIyuP8krhB1VUSHHRxidPLGIvNZTh8LEOawBGJ0Hh9OqwYG/RvZ/IHEDDIJRHOeQt3j+I4/v9ghgHPM4YiTG/cPajD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714191949; c=relaxed/simple;
	bh=X2gig5u+4kkxfvwDP2PFggk8gIpIlYRNQFFkvmtEtcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX/M+WuaO4ejdSBNinL+dmMrlOc1qd1jy8T8zY5S+OlRdJo9X3c9cE4p45Vnk9czRFec8DvgzIKTuXvsbhwa27hAqc9YgIkUthufgUd8vshOgdLS1BBDz3lBJCjQRbfZUJITn/k3lP4x/fuNy6EU5rPwAVI9UU99v8j4T82n61o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8AxR_BIfixmYN0DAA--.15406S3;
	Sat, 27 Apr 2024 12:25:44 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxP1VFfixmABcHAA--.4027S3;
	Sat, 27 Apr 2024 12:25:42 +0800 (CST)
Message-ID: <f402bf42-98c9-4433-9efc-c3e13b0853e9@loongson.cn>
Date: Sat, 27 Apr 2024 12:25:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Jonathan Corbet <corbet@lwn.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <87zftgnsun.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxP1VFfixmABcHAA--.4027S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF15Zw13WryUCF17Jw4xuFX_yoW8XFykpF
	sxKa43Kw1DGr1IyF4fur4UZa4Ikr13GF4UJr1DW3s8Cw13XF1SkrWSvw4Y9FWxCrn5Ww1j
	qr40yrZ3u3Z8ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	kF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0L0ePUUUUU==


在 2024/4/26 21:42, Jonathan Corbet 写道:
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Fri, Apr 26, 2024 at 9:00 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>>> v2:
>>> * As Miguel's comments, translate commit 01848eee20c6
>>>    into Chinese, as well as commit 81889e8523e6. By the way,
>>>    these two patches haven't appeared in the doc development
>>>    tree yet, maybe we could consider merging them into the
>>>    rust tree?
>> The former is in `rust-fixes`, which will be sent to Linus for this
>> cycle. So the English docs will be updated sooner than these updates,
>> if that is what you are asking.
>>
>> For the other one, it is in the RISC-V tree and I assume it will be
>> sent into the next merge window. I don't know how you normally handle
>> that (i.e. translations being updated at the same time or after a
>> cycle), but either way, I am not sure why you would want them to be
>> merged into the Rust tree?
> I guess I don't see any reason why the translation couldn't go through
> docs-next as usual?  It will all even out during the merge window,
> right?  Or am I missing something?

Yes, you're right.


I mean, in order of order, I should translate these two patches in the 
next window,

because these two patches are not merged into the doc tree yet, and if 
they are

merged into the doc tree, this may cause confusion for readers and 
reviewers.


That's why I mentioned it on the cover letter. Of course, it would be 
great if the

patch sets were  merged into the doc tree after reviewed.


Thanks,

Yanteng

>
>


