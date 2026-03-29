Return-Path: <linux-doc+bounces-81689-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLqVAo5ZyWkuxgUAu9opvQ
	(envelope-from <linux-doc+bounces-81689-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 18:55:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D203532F8
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 18:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E714B300BCBD
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB2E3822B5;
	Sun, 29 Mar 2026 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Y8H0lB5L"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C13815C3;
	Sun, 29 Mar 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803270; cv=pass; b=pkLKuh7UZ1D21ScyzIR34ipeh6CJUocGeuSqtaulyIc69ezSJgjQHN/e/oac26QgF14Ka0AE9z62C2ZkPUqTfT+cAxHCSvwm5pCp0oDKREXIkeIv7VhLC8TqNpQ36UL15cw58c0Luc38EjnKpeYnO79cVePRJ0nk5PUwBh10MnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803270; c=relaxed/simple;
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=T6Q+yWPbT40wjMKBs3EVSc2RpJvM6yexDiTgndCELPKG33A0Bn/IRdDYf1yTFRwyWPt87S/+opZbpo4RjukvAg5ea8obE5xSqxWW0HRunT1Qj14qnSryl5FyvMLTD1mpuw0XKCSAtBXkY9jk3c1SS3UR4RrPrNmQpFAXrhv/KVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Y8H0lB5L; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774803262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B69YBhdWna/7HIu7zVL+U3Vth+YFBTFroqzQtLJ3J4ijpi6G6csqDVwAehlNPcYZT5o41ArvngCMusNsd/M7WPnpbj49YUJShlaD8oD0JJsAHz3JkoLamvfbkUYxJeFp4adZq9j7fc3w6l7aCG978vlrp+yM9fr1qoMQTd00SXc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774803262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=; 
	b=JJGWuEQULX5545SxZi12yt5WQXFspCHBXWyQXFrQCxqcd7BHAmeX4OM3e7KFO/Sn8FHD8w6lcW8052G7LVtq+6GxCOAZvaBbTA3R1xB6TlkR+sgXL/Y1U0cXQh5lAD5t3f5tQKKNyXwFPB8dFODvo2BmEDwOmKi6Q4HzuMz3DOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774803262;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=;
	b=Y8H0lB5LcYnH1i+o+ZVRZTUwK+rPJrMTA3pUMTmQ2bO4x8sSCOCb/q+7S+fo300a
	L6QCAWpfjUbZmih5K/VPGQXYqrlolJlPKMCSumZMEP+mDHi/8GxazUi/jzFQothVrsD
	xsVUyIKoEz6W5vHPAMP+ndW748zObLn6vgQuAH+0=
Received: by mx.zohomail.com with SMTPS id 1774803260377756.2557376463045;
	Sun, 29 Mar 2026 09:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 12:54:17 -0400
Message-Id: <DHFF8WQ9Y587.18HSE8KTKYCGP@ritovision.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <mchehab@kernel.org>
Subject: Re: [PATCH] docs: generate a static 404 page
X-Mailer: aerc 0.21.0
References: <20260329152047.5736-1-rito@ritovision.com>
In-Reply-To: <20260329152047.5736-1-rito@ritovision.com>
X-ZohoMailClient: External
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81689-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ritovision.com:dkim,ritovision.com:mid]
X-Rspamd-Queue-Id: 57D203532F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I=E2=80=99m going to reroll this for proper multi-language support.

Rito

