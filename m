Return-Path: <linux-doc+bounces-74983-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AObYIidPgWlMFgMAu9opvQ
	(envelope-from <linux-doc+bounces-74983-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 02:28:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD00D35FE
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 02:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCA8B300B133
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 01:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6DF2288E3;
	Tue,  3 Feb 2026 01:27:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5F9214A97;
	Tue,  3 Feb 2026 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082072; cv=none; b=JEBRDm/Oi7elk/uMow26kC0GgyIyDqvGWFVdGAvXF0M57eRcI1emQeojJl0pRj8wyPRue3c1InZW6gjyauQQOMiYvcaNq5VUDdE/Ql4OY4p2y8WZoc4jMaOtkGeb6y5WoAFC13GqFNIeDVbN5aWBsq6Wj0rcIA0Y90mEsOBZBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082072; c=relaxed/simple;
	bh=FNmO9nQ6OfXen7WHbQQO+EOQ/dk0srl6VZ/gckKBOUY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=olK6CghPxqVfnSv2HkDWJTaiyVV68+81ARUPocWiRUIG5CdJmHYoGrX0Q8OJorlldUA9VT4iZpz30V7yYkXYv6ocv36QWxosugMfp+mvDu6Q1K+BmAtoBTT4zFkvcF2JvPqnjKXV0iYtLbB/Yji7oHVuqZRRpF0PAjcA7Oylfqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Cx68IMT4FpUDUPAA--.49010S3;
	Tue, 03 Feb 2026 09:27:40 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJAx28EHT4FpD8M+AA--.49323S3;
	Tue, 03 Feb 2026 09:27:37 +0800 (CST)
Subject: Re: [PATCH v10 2/4] irqchip/irq-loongson.h: irq-loongson.h
 preparation for Redirect irqchip
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-3-zhangtianyang@loongson.cn> <87pl6nfotl.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <8f7c106b-43c6-1957-35d8-6cebbeb50edc@loongson.cn>
Date: Tue, 3 Feb 2026 09:25:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87pl6nfotl.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28EHT4FpD8M+AA--.49323S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUPKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_JF0_Jw1l4c8EcI0Ec7Cj
	xVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j83kZUUUUU=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[loongson.cn];
	FROM_NEQ_ENVFROM(0.00)[zhangtianyang@loongson.cn,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-74983-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EFD00D35FE
X-Rspamd-Action: no action



ÔÚ 2026/2/2 ÏÂÎç5:59, Thomas Gleixner Ð´µÀ:
> On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:
> 
>> Interrupt redirection support requires a new interrupt chip, which
>> needs to share data structures, constants and functions with the AVEC
>> code.
>>
>> Move them to the header file and make the required functions public.
>>
>> including:
>> 1 marco AVEC_MSG_OFFSET
>> 2 struct avecintc_data
>> 3 Make avecintc_sync public
> 
> https://lore.kernel.org/all/875x8jmsa8.ffs@tglx/
> 
> still applies.
Ennn.....let me try again. Thanks.
> 


