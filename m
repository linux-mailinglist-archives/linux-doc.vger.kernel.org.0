Return-Path: <linux-doc+bounces-95320-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jf+4F5G0TGrXoQEAu9opvQ
	(envelope-from <linux-doc+bounces-95320-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:10:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3092718EF3
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:10:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Mr2sA5O2;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95320-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95320-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B05B63023316
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 08:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AB92E7399;
	Tue,  7 Jul 2026 08:10:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424F2E7F39
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 08:10:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411827; cv=none; b=PLlB+lMm0NawL8zirErH15hnUrzFYsLMkRA9KKbpvlOcpCv1hR6MGZu3sFIcXigD8MWTatSOaB0KVPbP/8+tACGaA740eQPoQk2TM5XfOU2d9M1jisTToUBYeWpR0lV4BEOuNcxP4Qv0VCnh7F0h6+0+dIZhvmbR6/d8koVbt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411827; c=relaxed/simple;
	bh=JoijE4uJCyq2j4khlPNuxF9JMy8fYGszG7NSw2HhBR4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pfgWJxU2Jnc6HEgb3OsaCpS8cXoWiB3y4rZOydVievKecvolmapQB+rpB7ASsyVWCasxatDCXmZV2PQG5yZq7+rqaOZ1OBKLf/ndVI3sMGt6F0BEzYHGJ6YS+ptVHydCOWvDNSDnhTfNUq5+XzmKPzuzgjY0Ni05D00bW43lyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mr2sA5O2; arc=none smtp.client-ip=91.218.175.173
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783411814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoijE4uJCyq2j4khlPNuxF9JMy8fYGszG7NSw2HhBR4=;
	b=Mr2sA5O2fwOZH+tdJVJbtFshcbUt3g6menEXK/k6fjP66J6bIxXN/uaF0WmGzyaLj2b2VW
	cY7kl73i6uSScBXlAmniWx4i6iDgVdgQJxt9MsQIpFlyQva0MSuZ1QtqGe3FGadARI53GI
	anr7Vxi7SJDpzawCZrnJt5t0V6M76zg=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
Date: Tue, 7 Jul 2026 16:09:35 +0800
Cc: Sourav Panda <souravpanda@google.com>,
 osalvador@suse.de,
 akpm@linux-foundation.org,
 ljs@kernel.org,
 liam@infradead.org,
 vbabka@kernel.org,
 rppt@kernel.org,
 surenb@google.com,
 mhocko@suse.com,
 mst@redhat.com,
 mhklinux@outlook.com,
 fvdl@google.com,
 gthelen@google.com,
 mike.kravetz@oracle.com,
 pasha.tatashin@soleen.com,
 rientjes@google.com,
 riel@surriel.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <48E0B0E2-4CE2-40B5-A7C3-9DEEF9F49C41@linux.dev>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95320-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:souravpanda@google.com,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mst@redhat.com,m:mhklinux@outlook.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:david@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[muchun.song@linux.dev,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,suse.de,linux-foundation.org,kernel.org,infradead.org,suse.com,redhat.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muchun.song@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3092718EF3



> On Jul 7, 2026, at 15:29, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 7/7/26 08:42, Sourav Panda wrote:
>> Overview
>> This patch series introduces a dynamic, NUMA-aware HugePage Cache,
>> backed by a kernel shrinker to safely return memory under pressure, =
and
>> integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
>> specifically targeting gigantic (1GB) hugepages. The goal is to solve
>> the tradeoff between allocation latency and memory
>> fungibility in virtualized and heterogeneous cloud environments.
>=20
> Hi,
>=20
> in general, we consider hugetlb nowadays to be mostly in feature =
freeze, as we
> realized a while ago that adding more special casing on top of =
something too
> special for all of MM is only going to hurt us more in the long run.
>=20
> We want to have less special casing and less special sauce, not more.
>=20
> Now, there is nothing wrong in making hugetlb be less special, by =
making it use
> more of core infrastructure etc.

+1

HugeTLB is already complex today, and the last thing we want is to =
compound
this complexity by piling more features on top of it. I fully share your =
view
that we should avoid going down this direction.

Thanks,
Muchun

>=20
> But optimizing for surplus hugetlb pages by teaching hugetlb about new =
caches
> and its custom free-page-reporting support rather looks like the wrong =
direction
> for me?
>=20
> --=20
> Cheers,
>=20
> David


