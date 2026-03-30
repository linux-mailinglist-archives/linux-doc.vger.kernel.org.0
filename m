Return-Path: <linux-doc+bounces-81767-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC1CHLmWymkR+QUAu9opvQ
	(envelope-from <linux-doc+bounces-81767-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:28:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A535DD6E
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7AE231586BA
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CAC33F5B3;
	Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KFsWmXyN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4098A2F25F0
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883843; cv=none; b=NgCQnGEuUDeWQSc9YqOzxd3fsoGckZDLPC4YZnYUzyJBnCSSDMaCx3Itd01MOWMj0+UnTesfQcrJ8BpNuSHAv8Q6ERL3yeDr/BD22s48gUIyVJvS8BpFFM/LX+O2GPmapdI95rT8OSm4icedU5WmawI5okkIErzkqaDcmAItFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883843; c=relaxed/simple;
	bh=0dsg8yKt4vaz4pQLgupbCfWEdGUuBGEH/sGlBChmCYY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=N3N5UjkV2gwO4wSurC+ZeFhIJIeT85x54+dPUzXvR6xZnL5EDzFiYvxvqm0Rd8ljLUBA9bhVmgnkCNinkvc8Fy4nfdcBhNO0PJCxJICjmVwwNORe+IAZAmyb+qLw8Taz86UDZ3Cog+k799BGKKu40vzIg669fNjPD0E4dyrlJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KFsWmXyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A428CC2BCB1;
	Mon, 30 Mar 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883842;
	bh=0dsg8yKt4vaz4pQLgupbCfWEdGUuBGEH/sGlBChmCYY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=KFsWmXyNF2A9m0HRkj5U78spOHMYa9XA+AXscBOmOJXFE9SFcui0OIUuxcLJ3oiP7
	 W/gmsP30bqEtpzRWWZrUJSGsqr+GFCiCwIVVo+ck9RTjpBi3Af9f0XZZo0jMsUCXIH
	 olKvqtqRc+pAwozrh3IzpleBjwt8WEH3jWwRXV4E=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/5] docs: add maintainer-kvm-x86 to
 maintainer-handbooks index
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-2-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-2-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383989.1817745.12081159398263745559.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=427;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=0dsg8yKt4vaz4pQLgupbCfWEdGUuBGEH/sGlBChmCYY=;
 b=+FLOeh4vjPft9ZXbJ/qulfvFR7n74pvL4Ri9SVVgONM483JtEmgWy2D+Q99CvudgrLVndxoTB
 3jqtZ/1T0QjDq3NpOd6qRCl5FXdVpOxNcKZgwQY8/GiVspotcHxTDXh
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81767-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E85A535DD6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 13:50:35 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> Include the KVM x86 subsystem development process notes to the main
> documentation tree. This ensures the new maintainer guide is properly
> indexed and reachable.

This doesn't really belong in this series, since the rest of the patches 
deal exclusively with the PGP maintainer's guide. It should be a 
separate patch.

-- 
KR


