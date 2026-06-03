Return-Path: <linux-doc+bounces-90660-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IZ/vJ+TLH2r+pwAAu9opvQ
	(envelope-from <linux-doc+bounces-90660-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 08:38:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92E634B2F
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 08:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=lvIr5bWK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90660-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90660-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6AFA30053EB
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 06:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDFC22FF22;
	Wed,  3 Jun 2026 06:31:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BE134CF;
	Wed,  3 Jun 2026 06:31:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468305; cv=none; b=IW7e1LXQwdcKYYOhxfmdlMavRKvxRscZORoVI0CPzEyvMFbXoKqhOFQn3+7vANr1ZbAry6VZQbDwx40k9uf/TjGK79P74Dob9pz4p1aAiYSkWEIGGyG/IysorDWc6heafwGVj4pvPMXhOEQcXKsEpGepiOVRT2c7H9myuD+2blU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468305; c=relaxed/simple;
	bh=2q2ugerjgL6wVj+WQL8tmnGAKVOI2Vi6rkdVQljgMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEmLamMFxftD7e+SSVTOa04LcP6yfYj5TtOAHYbKTyTqmxX48mVm/dOiN+1cZj4g/KixgEnkNjRdiwG3nDiTgYLv8Jus8f2LihOkTa41p6P7tCuSNNqmQABRz9yu0J0Vy4zHWC6AcGX59uGVcytXRYsLt7FQRN/QuiXD9xY1Xnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lvIr5bWK; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652NEGd93263017;
	Wed, 3 Jun 2026 06:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vpfiUp
	P7svL7IHXiwn4wMTU4yD8RUacEtIF8X7A+ATM=; b=lvIr5bWK4vTgC90AqFI8T0
	sYuL5/YbovfBy75RAhpEaxm1JKHdD5SbafpGY6JD24W9IJz2rgc+wF5fpNsIw/N+
	bPoGfFl2hDt8UEXvk2+cvCgh1unQ/itN1kJEvseoaR4aFRhZEkx+IEnWLGgP7jjG
	w9J1+NJ2zKvrgBJxI05DY6z30xSdrU7OzlbiZ4KOf0rcMN2kCohWJs7RZTXdABys
	JDO6/yDLI4Y37dBR154pC1xnugbrDXD/FeQQUcxhgYNzR0DZUdxKmLhHRpmYejeC
	aQUoD277/uaw+5zFxsCp+9jG684NYgG8vY/03N/pGqrfjXidXbMdPFIBeMXqbYRQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4efqm51fts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 06:31:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6536O5Uu020209;
	Wed, 3 Jun 2026 06:31:28 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4egb7k6w84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 06:31:28 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6536VQTL18154238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2026 06:31:27 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18615803F;
	Wed,  3 Jun 2026 06:31:26 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AA2458056;
	Wed,  3 Jun 2026 06:31:20 +0000 (GMT)
Received: from [9.39.24.115] (unknown [9.39.24.115])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Jun 2026 06:31:19 +0000 (GMT)
Message-ID: <884dcf1b-bb4b-491e-abaf-25db66a66b52@linux.ibm.com>
Date: Wed, 3 Jun 2026 12:01:18 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] KVM: PPC: Book3S HV: Validate arch_compat against
 host compatibility mode
Content-Language: en-GB
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
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
 <72ef4cdb-8d9e-4319-9c94-b9a46a6f6194@linux.ibm.com>
 <56c84e26-69ed-433b-baaf-7b53acc60391@linux.ibm.com>
 <bjdsw43g.ritesh.list@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <bjdsw43g.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: S5quD5hyfQTdDsfrZoeO3hioHd3LLaWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NiBTYWx0ZWRfX5K7siemZgKLS
 d6GkwExqE+1zYIuBn/+MUdCSKKj79eydHtjAy9fFHs+ss8MdJNVxfQWg2+q5RJqef1FlXM0ZUz1
 WCd6/clY+xWb060Ns9bblf5o8q5b1M1lLfUTbTSWRrar2l2rX5Jwi599tQnCN2SQXwvwy5W71Mo
 fPl9B5urr2SeJH84lM46BS034hO9gkfR3BTFYrNl3dGGnAHimhKLVNBeKYPIiQ4+wySbLom3ZDT
 ztiizxd3dPZvDy35sQZOYi5cD/w5pLNTZclD0c0Dcb/c2Xbw24XsuC15KBiSsuDh3tGBhAS8BYu
 ajskxoXkj7Whucm4OLvRCEcjRQNPmYsWJBGC2DVNafHJnN2YG7WEvHylhDw02bXBEjia8RDB5o8
 6y5NDYVl7QPVarmh5SYdyQAvUm+ekc32t1Za3g/7tRvkbEz+cTw6c1g5xyM9PLdvujz4RDBX7dQ
 Tf6J8UiUA+cF4QVE+Pg==
X-Proofpoint-ORIG-GUID: mb9ElHwTvzmqrueOPOjvFKq1lMCCseAd
X-Authority-Analysis: v=2.4 cv=Vf3H+lp9 c=1 sm=1 tr=0 ts=6a1fca42 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=f7IdgyKtn90A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=-XpCkPrO0wptMrQrKwIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90660-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,linux.ibm.com];
	FORGED_SENDER(0.00)[harshpb@linux.ibm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:maddy@linux.ibm.com,m:vaibhav@linux.ibm.com,m:amachhiw@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:anushree.mathur@linux.ibm.com,m:pbonzini@redhat.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:lkp@intel.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,redhat.com,gmail.com,ellerman.id.au,kernel.org,lwn.net,linuxfoundation.org,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshpb@linux.ibm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF92E634B2F



On 03/06/26 11:35 am, Ritesh Harjani (IBM) wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
>>> amit, can you just post this alone as a separate patch, so that we could
>>> pull it for 7.2 merge?
>>>
>>
>> FWIW, b4 am -P1 <mbox> should fetch this patch alone (and not the entire
>> series), See b4 am --help for more options to select a subset of patches.
>>
> 
> I agree, however as an FYI in this case -
> I had few review comments on PATCH-1 here [1] - which along with the
> commit msg changes, also had a code change involved, so IMO, it's still
> a good idea if Amit can test and send an updated patch separately for this -
> to be pulled in for 7.2.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/pl2g6xbz.ritesh.list@gmail.com/
> 
> 
> Replying to Vaibhav comment here so that we can reach to the conclusion
> at one place.
> 
>> Hence IMHO, this patch can be marked for stable tree and potential
>> candidate for 7.2 merge window. But dont see applicability of a 'fixes'
>> tag to this patch
> 
> I agree, we need not use a fixes tag then. So, we shall mark this
> with v6.10 tag then.
> 
> Cc: stable@vger.kernel.org # v6.10+
> 
> (I calculated this based on when Power11 was added:
> git tag --contains c2ed087ed35ca    | grep -E "^v" |head -1
> v6.10
> )

Thanks for help with this, Ritesh!


> 
> -ritesh
> 


