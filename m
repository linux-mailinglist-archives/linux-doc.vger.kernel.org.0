Return-Path: <linux-doc+bounces-84434-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMBcEK0S62lsIAAAu9opvQ
	(envelope-from <linux-doc+bounces-84434-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 08:50:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4945A577
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BC3301A933
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 06:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD1335CBCB;
	Fri, 24 Apr 2026 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DPpgY3/S"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D675F32AAC6;
	Fri, 24 Apr 2026 06:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013318; cv=none; b=GOIUmMricNqRZ3niV+tqqjHJNUdDzV0n/ZtJgY1anRZFE6ZhGKB2Gwn0oHQcNIU8GFXcdKD/F+6IxIKdcoEDjXsfIkQ8uPvQy5mxSfcpv0UdefsIRWcNtoCVhBlJs32aLUJcUQcJHIvN/QJR1xhU5JWDVJ4m8XjB8AvFoA+v7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013318; c=relaxed/simple;
	bh=0wOOuJYHpYbOuEeycs12zNp1Rnfrdks0Fil+00MPKdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nvZt6VRMq2O9+FsmVbhg0+qZW2tjE3B3tbxKd+xwaANVzlZ2mv73fLChlf8f79XRnRxsd7zyr16rOUGsi2041EJOWgRNZf6oYbTHOIEVDauAPIUkLs3zdIpOxWPgF9KyfXTmPWvZpAw1pQZ7/iUEp5WzY1BcqNi1ymAKF0sfAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DPpgY3/S; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0wOOuJYHpYbOuEeycs12zNp1Rnfrdks0Fil+00MPKdM=;
	b=DPpgY3/SfNnZvib1urs+Yfyun56s9Ml4uYUtkoTnCjHagEI862zCQ98Mm0uv7Kv5WMucEYxVE
	/0N5//JNhot9mldmWAhp0DwClZd9KdKYDAhpr6g38pR7C5MCM8CtB68TQPGZpf1drJ7UHRIafJp
	j5d1FwoAyQSHAjPU7KsNtrc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g23Kg1SZnznTVg;
	Fri, 24 Apr 2026 14:42:15 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 08CAA402AB;
	Fri, 24 Apr 2026 14:48:28 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 24 Apr 2026 14:48:27 +0800
Message-ID: <0403d30d-e75e-4922-b8c1-8cae349f3dc2@huawei.com>
Date: Fri, 24 Apr 2026 14:48:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF
 events
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <yezhenyu2@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <20260225040421.2683931-5-zhengtian10@huawei.com>
 <acQj5grOdZT8LUGp@devkitleo>
 <e3253959-0340-4c13-a980-a599e090a6de@huawei.com>
 <acabezCO4B5BE40Q@devkitleo>
 <4e800c1e-25db-4aa2-b100-63434973de93@huawei.com>
 <acpfD3YjMpEdL5KZ@devkitleo> <aeeHNMqDx5Yipt_K@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <aeeHNMqDx5Yipt_K@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-Rspamd-Queue-Id: A7B4945A577
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-84434-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengtian10@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:mid]


On 4/21/2026 10:18 PM, Leonardo Bras wrote:
> On Mon, Mar 30, 2026 at 12:31:28PM +0100, Leonardo Bras wrote:
>> On Sat, Mar 28, 2026 at 02:05:25PM +0800, Tian Zheng wrote:
>>> On 3/27/2026 11:00 PM, Leonardo Bras wrote:
>>>> On Fri, Mar 27, 2026 at 03:35:29PM +0800, Tian Zheng wrote:
>>>>> On 3/26/2026 2:05 AM, Leonardo Bras wrote:
>>>>>> Hello Tian,
>>>>>>
>>>>>> I am currently working on HACDBS enablement(which will be rebased on top of
>>>>>> this patchset) and due to the fact HACDBS and HDBSS are kind of
>>>>>> complementary I will sometimes come with some questions for issues I have
>>>>>> faced myself on that part. :)
>>>>>>
>>>>>> (see below)
>>>>> Of course! Happy to exchange ideas and learn together.
>>>> :)
> Hello Tian,
>
> On the above, HACDBS depends on HACDBSIRQ which can be announced by either
> device-tree or ACPI.
>
> Do you think it's ok for it to be ACPI only, for now?
>
> Thanks!
> Leo

Hi Leo,

No problem with ACPI-only for HACDBSIRQ for now.

Feel free to let me know if you have any questions while working
on HACDBS on top of HDBSS.

Tian


