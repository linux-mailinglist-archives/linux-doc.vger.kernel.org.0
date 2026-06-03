Return-Path: <linux-doc+bounces-90644-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l/CmOkCvH2rEogAAu9opvQ
	(envelope-from <linux-doc+bounces-90644-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 06:36:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B786342A5
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 06:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=o+FBCL2v;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90644-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90644-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF8B3014DA8
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 04:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCD6380FC5;
	Wed,  3 Jun 2026 04:34:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D32D9796;
	Wed,  3 Jun 2026 04:34:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780461244; cv=none; b=agoqc0u6yoxIF4Q/0osSTcgS1wm7FBRi9PwRLwKoukGVphDQKG77h0HFuGUAbDsNftb5XXE6r/npMqnP/QRIzsY6EpzJUafPCveQrbwFjEcvVwGDc4Dos+JIejj4CF9KF0Hl/vuhSAR8iqYI/QqsRyhF01QdwhLZrOGNnvDo35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780461244; c=relaxed/simple;
	bh=kvddOoybUFXc1NoiFxZ+x0RENdLvO6ZnHLrVZtZ6gdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFmlDuHZyv7mbh1lri3/NxNdhLKp6omaMhxheX728lcwHHAKmANwSc2kPuMHACYdd0jiLkhvHynPZL7flUAuq4WPQzC9b5DCSwGkBYzYIgS/mrUBiusSzfqXNiObjKuoR84d+J4PE6C1UX1sgFXyFp39m2uHcxm3XQ2Ms14N7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=o+FBCL2v; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6533K9Ua065560;
	Wed, 3 Jun 2026 04:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kvddOo
	ybUFXc1NoiFxZ+x0RENdLvO6ZnHLrVZtZ6gdE=; b=o+FBCL2v6kHW2atqZTNJRF
	J5jCRfTmR27uM0WVu0jictBN77DNvfJ9QCw1scR/5Ui6nJgDnpt17dBO/7Fek8js
	cWKGqQVmpjIrd/j7fS3P9OWkYJ7U8irOfKWXecbZuWYHOG9gxLxZk4lF4UVdqZs0
	0QQAANAhOJwEleXsSWSUGQe8s45dmzvvbbjOFR4pFGIDdwRfW8AkX4hXSwAPs7OI
	T3vy4c0LajAZF3XKtULBy/EzAzOLkqiax2Fv6m/WzD7gGJbzzhQ6RDOPYTN2GhmC
	FvSc3T61xn5i3P90/9SCUKRbZYxCzhz0DktkD7NMDPGp0leoija6qEAHQjWfhGMg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4efqm514g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 04:33:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6534OGpI026625;
	Wed, 3 Jun 2026 04:33:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4egb7k6hre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 04:33:47 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6534Xjon29360826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2026 04:33:46 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3A0F58043;
	Wed,  3 Jun 2026 04:33:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 311075805D;
	Wed,  3 Jun 2026 04:33:40 +0000 (GMT)
Received: from [9.43.74.208] (unknown [9.43.74.208])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Jun 2026 04:33:39 +0000 (GMT)
Message-ID: <72ef4cdb-8d9e-4319-9c94-b9a46a6f6194@linux.ibm.com>
Date: Wed, 3 Jun 2026 10:03:38 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] KVM: PPC: Book3S HV: Validate arch_compat against
 host compatibility mode
To: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
        Anushree Mathur <anushree.mathur@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, lkp@intel.com
References: <20260522152744.55251-1-amachhiw@linux.ibm.com>
 <20260522152744.55251-2-amachhiw@linux.ibm.com>
 <pl2g6xbz.ritesh.list@gmail.com>
 <20260529141530.fc225a67-e9-amachhiw@linux.ibm.com>
 <cxyewhx8.ritesh.list@gmail.com> <87se74z4a6.fsf@vajain21.in.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87se74z4a6.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: q6e2x-AcJDTwv3M8RhxKWN1BRY5wFEu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAzNSBTYWx0ZWRfX4ZMUqq6fwN2Q
 At/ksknke4oUT9bbLPIajFcxQNPuWHhUgM12NtgFj2fNY9QtEztt32j6xmq0oTbLv9jdXCvcSO0
 B1d9TIGjioylMEvA4RsrNYdd9SI30yqULWz1l+ENGAlMN8YLQut9mgEXc2dOCXVf9vhsQHN8On4
 j/RGZKUOIPs9omGdfLmc1bgMJChKPMvzZd4PK80UiYEkw1ynDTTp9ADuR3H1KlGH7TEEg6f91C3
 XVLlRdpbPOOfyS/Jbvac77RraUzENMnxA90wJbAiKXg4XLstDGxSrTvGz3PdNyNB3TFnnyEUsz6
 N+epBhXkCrAShyDQqpK4h2DBWNqQqfgagQm1Uk3XgeT+y0mkbLmKZ7CYMD3EYdzrwjwOZC+vPvo
 WwvTMsqYxYZjeAP1KqZpsx44RpXjMQZNgT7f9HVQqXqdw1ywEdeiuP9kkTi4WoPMIYgE28XvBGM
 lq2eo8rMUa08ZR+7c6A==
X-Proofpoint-ORIG-GUID: y-ruEHZMhRSPCxsh_y5Qrwtw0T9K3Lbw
X-Authority-Analysis: v=2.4 cv=Vf3H+lp9 c=1 sm=1 tr=0 ts=6a1faeac cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=JsEDthbVA9rSTmNpvhMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90644-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:from_mime,linux.ibm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.ibm.com,gmail.com];
	FORGED_SENDER(0.00)[maddy@linux.ibm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vaibhav@linux.ibm.com,m:ritesh.list@gmail.com,m:amachhiw@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:anushree.mathur@linux.ibm.com,m:pbonzini@redhat.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:lkp@intel.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,redhat.com,gmail.com,ellerman.id.au,kernel.org,lwn.net,linuxfoundation.org,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maddy@linux.ibm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45B786342A5


On 6/3/26 9:03 AM, Vaibhav Jain wrote:
> Hi Ritesh, thanks for looking into this patch. My responses to your
> review comments inline below.
>
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
>>
>>> So, we would still want to prioritize the whole series
>>> instead of just this one patch.
>>>
>> Patch-1 could go as a bug fix even in 7.1-rc6 (or maybe with 7.2
>> bug fixes). - Maddy?
>>
>> So, you may want to add a fixes tag and maybe even cc stable if you are
>> seeing this issue from older kernels maybe when nestedv2 got introduced?
> This isnt a 'bug fix' per-se but rather strengthening of compat mode
> checks so that any non compatible PVR being used by the VMM can be
> caught early. The hypervisor anyway ultimately prevents non-compatible
> PVRs from being used by the VMM. So there isnt a bug thats being fixed
> in this patch.
>
> The rest of the patch series builds on top of this patch to advertise
> the available compatible PVRs to the VMM so that it can further
> preemptively prevent users from forcibly using a non-compatible PVR.
>
> Hence IMHO, this patch can be marked for stable tree and potential
> candidate for 7.2 merge window. But dont see applicability of a 'fixes'
> tag to this patch
amit, can you just post this alone as a separate patch, so that we could
pull it for 7.2 merge?


>> However the new UAPI discussion might still require more discussion with
>> the community and I don't think it is ready for 7.2 yet ;)
> Somewhat agree with the above
>
>> -ritesh
>>

