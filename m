Return-Path: <linux-doc+bounces-15241-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 450318B4462
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 07:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777F11C21F25
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 05:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1E541C73;
	Sat, 27 Apr 2024 05:31:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615AD41757;
	Sat, 27 Apr 2024 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714195867; cv=none; b=byco9agbz7OPVDVNbwK2OqJ6omv4sMx2wPPX1WcisOHfC8weI865Ye5mK9Rm2luK+RqJfJckBemLi2Vgu0Opy+LAERBjo9QeaRdgQFkNkIXPGMrljoT+8L7wtU2AK56d4uXRSJ0WOOGfEwauKwuhBYT5DzqJ4uO5hn/qTfseKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714195867; c=relaxed/simple;
	bh=79TQ462jbwVflfa7QchENZpG3niIttwX1/7ZnhJWLWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prkjwvH3N8KBGEb9/WA+bJB7O1DBHt/8qRN/9RxAT5SVTJado3eF0LJGuOXcTOP1bhEZ54cEs5jo5L7h1SEuGx5fbobM+Ejihm1ZGAn5qXIOp5QXXZgQHII1vYejzrSL8qiIrEdR0nExUnuGcYu9BTDJt13lA6v1KPM5QxFSBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAA3j8dkjSxmlUgKAQ--.36537S2;
	Sat, 27 Apr 2024 13:30:12 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wAXaDVgjSxm5Gc7AQ--.1529S2;
	Sat, 27 Apr 2024 13:30:10 +0800 (CST)
Message-ID: <69f68a2f-2234-4fad-914b-9507abf8e3e2@hust.edu.cn>
Date: Sat, 27 Apr 2024 13:30:08 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs/zh_CN/rust: Update the translation of
 general-information to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, corbet@lwn.net,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <09fc6c2e0553fb5fae9c91146e1bceb149b6cf71.1714113680.git.siyanteng@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <09fc6c2e0553fb5fae9c91146e1bceb149b6cf71.1714113680.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAA3j8dkjSxmlUgKAQ--.36537S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWrKr13Zw1DuFy3AFWftFy7KFg_yoW8JF1kpr
	Wqk3WSq3W3tw1rC3yxGr42vw48GF93Way5Wa17tas0grs8tw4ktrZrtr1Ykr929ry8XFWY
	qFsIyFyj93WFyFDanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j-8nOUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/4/26 15:02, Yanteng Si wrote:
> Update to commit ba4abeb13d5e ("docs: rust: Move testing to a
> separate page")
> commit be412baf7240 ("docs: rust: Add rusttest info")
> commit bd9e54a42ce2 ("docs: rust: update Rust docs output path")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> ---
>   Documentation/translations/zh_CN/rust/general-information.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
> index 6b91dfe1834a..251f6ee2bb44 100644
> --- a/Documentation/translations/zh_CN/rust/general-information.rst
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -32,7 +32,7 @@ Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
>   
>   要在你的网络浏览器中本地阅读该文档，请运行如::
>   
> -	xdg-open rust/doc/kernel/index.html
> +	xdg-open Documentation/output/rust/rustdoc/kernel/index.html
>   
>   要了解如何编写文档，请看 coding-guidelines.rst 。
>   


