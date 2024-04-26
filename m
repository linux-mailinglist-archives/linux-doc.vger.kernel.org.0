Return-Path: <linux-doc+bounces-15137-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF618B3041
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 08:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC98A28559B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 06:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B65A13A41B;
	Fri, 26 Apr 2024 06:21:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7613A410;
	Fri, 26 Apr 2024 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714112510; cv=none; b=ls4pCgVofPqcy042Ja/2YtC6sE0E8EcGhSeVQwRNtAIVT/PXV8weCKEonUjYUm5Ofqs/aYWKgPoS5l9Mw8zlAwdRfVGyfsnlAw+DptqjPPytVYdAwZmNOwkX4FNvrkQJ+fykVaFXlmTaoiTm7XqpfrPr4vCMFNnSPnaj8UZ6PUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714112510; c=relaxed/simple;
	bh=MFWLCQpaZV6DcDzNu+sVa5KZp27IZ3lkmg1HeGpldtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnuXpeWjXsvvLIPe2ZSULyzJr2ZPVrD26pY/XyjHUNXP6qxCZdGIKAgRJWtYP18x4JpV3gLb0evfoiK3YI5nimgrahwgNdJWzQpMAAMR8G4epV5Pi9ZRmw+86fDrsyqoQc64eyqgAyxYE1Ms9Q/umGHRlpfVz0pxGMAbSxaC8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxFun4RytmQlYDAA--.1615S3;
	Fri, 26 Apr 2024 14:21:44 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxLN7tRytmivgFAA--.19153S3;
	Fri, 26 Apr 2024 14:21:34 +0800 (CST)
Message-ID: <e19151b2-641b-4a0a-a88e-de4d879fbd8a@loongson.cn>
Date: Fri, 26 Apr 2024 14:21:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of
 coding-guidelines to 6.9-rc4
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alexs@kernel.org,
 dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1713875158.git.siyanteng@loongson.cn>
 <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
 <CAD-N9QU7uyJN7g1D1y0jZt9x64uDwvL3ynyXir6othOm=NpH9A@mail.gmail.com>
 <CAD-N9QXbToYg4VUDmStJ5Nt3Wu4o9UrNCaDQPMcq9tLrd=bdXA@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CAD-N9QXbToYg4VUDmStJ5Nt3Wu4o9UrNCaDQPMcq9tLrd=bdXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxLN7tRytmivgFAA--.19153S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4DJF47tw43tFyDCF4UGFX_yoW8Wr48pF
	yjka4fG3ZxKF1Ika4IkryrXF12gF93Ca1fWwsrJ34vvF4DtFyvvryDGrn0gF92vrW8Ga45
	Zr4F9F17Cw4FyFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUY_7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2
	xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkvb40E47kJMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUBjg4UU
	UUU


在 2024/4/23 22:25, Dongliang Mu 写道:
> On Tue, Apr 23, 2024 at 10:09 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>> On Tue, Apr 23, 2024 at 9:08 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>>> Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links")
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>   .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
>>> index 6c0bdbbc5a2a..d02e2dbff509 100644
>>> --- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
>>> +++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
>>> @@ -157,6 +157,18 @@ https://commonmark.org/help/
>>>
>>>          https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
>>>
>>> +此外，内核支持通过在链接目标前缀 ``srctree/`` 来创建相对于源代码树的链接。例如:
>> 前缀通常被用作名词。建议可以改成：
>>
>> 此外，内核支持通过在链接目标前添加 ``srctree/`` 来创建相对于源代码树的链接。例如:
>
> Translate the above comments to English:
>
> “前缀” in Chinese usually means noun other than verb. So I suggest the
> liberal translation "在...前添加" other than "前缀".

Okay!


Thanks,

Yanteng

>
>
> 2.31.4
>
>


