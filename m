Return-Path: <linux-doc+bounces-73670-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ9FHSQXcmksawAAu9opvQ
	(envelope-from <linux-doc+bounces-73670-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 13:25:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79A6696A
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 13:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBA077467F9
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 11:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E0C40B6EF;
	Thu, 22 Jan 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EmMicMAr"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD943E9CA
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082830; cv=none; b=qW8YHulh1gSzxce2MwE+tO4ihrSRagSxtvyDrMMzeykbblVs2Jph8fhiD2Lj1zORuCGnVOKdp2cHfR5XIlJvZ2XthuC8vtQTdZoa5bNNlHq89e2a2dGun3nc7cfnj52p7RS5Mdxmv58/tG2cDPgzdhHIypwKptrmNnDIBMcOI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082830; c=relaxed/simple;
	bh=W+0PNDwpKCP1K7GPitxRdMQyZK5OR2n6ivu/JoUwlaA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=S0QGdOZrYnFtWHNULbCgM15V7kOCYN7BjJQS92reypLrOkAOkgFewsrgCXbW1Ue9xbj6qDYmkDoykRTW7Y74DN+ZT/nWC+sB3L8VHHx5eG5iFRhhydoYS8tepAT81V7yDtWPWLoAfopY6ExTUVx6fqxhxcfsmyzhBbvqz2TtJCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EmMicMAr; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769082815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK3lpHbFMGMoogUekcAz2kADIERYkYftxCT2FRmWKLQ=;
	b=EmMicMArBlyYzb+D+vR715OwkPD0z9nzIGfjpZO5HTCVF4+7K2WAZKp+mM73BuLfQn4Xv4
	22T0gI2wR4WjYujVh24UdlzeogLeCXt+8iHDSTqedMbRe3mTgBVoKxS3n25fpqRQM9r2b5
	oHaf8RsTTbEpjH8slm6r/odSav0G6lk=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 05/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aXIKBhHd7IbaJkXg@thinkstation>
Date: Thu, 22 Jan 2026 19:52:52 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85016E74-E7D6-4AA1-8754-24B86496CEFE@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-6-kas@kernel.org>
 <EB8941D9-B6E0-41DD-9C44-038D21583E17@nvidia.com>
 <aXIKBhHd7IbaJkXg@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>,
 Zi Yan <ziy@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73670-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,gmail.com,google.com,suse.de,suse.cz,oracle.com,redhat.com,suse.com,cmpxchg.org,lwn.net,meta.com,kvack.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linux.dev,none];
	DKIM_TRACE(0.00)[linux.dev:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muchun.song@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 1C79A6696A
X-Rspamd-Action: no action



> On Jan 22, 2026, at 19:29, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Wed, Jan 21, 2026 at 12:12:13PM -0500, Zi Yan wrote:
>>> @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, =
const struct page *page)
>>> again:
>>> memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>>> memcpy(&ps->page_snapshot, page, sizeof(*page));
>>> - head =3D ps->page_snapshot.compound_info;
>>> - if ((head & 1) =3D=3D 0) {
>>> + info =3D ps->page_snapshot.compound_info;
>>> + if ((info & 1) =3D=3D 0) {
>>=20
>> This could be =E2=80=9Cif (!(info & 1))=E2=80=9D like =
_compound_head(), right?
>=20
> Right. But I don't see why it has to change.

Let me briefly explain my programming habits. I guess this might
be Zi Yan's idea.

When I use a variable as a boolean type, my habit is to use the
"!var" operator to check if it is 0 (false). When I use a variable
as a number (with a value range exceeding 0 and 1), and I need to
check if this variable is 0, I usually use "var =3D=3D 0".

The least significant bit here seems to be used as a boolean type.

>=20
>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov


