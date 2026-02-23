Return-Path: <linux-doc+bounces-76653-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOLcEzfMnGlHKQQAu9opvQ
	(envelope-from <linux-doc+bounces-76653-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:52:55 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E772F17DCA9
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BB75303AAAA
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851BF37996B;
	Mon, 23 Feb 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UKMUot/q"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B73793B3;
	Mon, 23 Feb 2026 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883525; cv=none; b=ryf0QUGTzdhKRTXVUSnUlQUnLRzOOhbbPCU21w/pT1AaJs1O9Dhz7LXluOudUdZQKJAOoN+gTaw2+Htr5v8cXIyxxsTCshI8ktTJeVklG73xXV2qqxmkQCQ2a+A8nvrzwpHPVb5HrOddbUhXPBeLMHToRRuNU8gNPJbFaivxfMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883525; c=relaxed/simple;
	bh=32IgMV6NneAaXouazxPDJLkrQ5F9CZetXO0pKusx+tw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CEmXvPZlh2vGbs3bFsK39wBhK5x7Hn3W9lKYBSYHKs5JaeCriZTkbq+bMTwMAzlTFaRBGd8BYRYkJAmV6hEJdql9dM1dK7tFfgMIGpUnVD2PRnlB628MdW88VwlL3gWQJvU0aL9payxvfkSpXle/qoRC8+e4xa4X7phsQ6Dq9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UKMUot/q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B672E40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771883523; bh=32IgMV6NneAaXouazxPDJLkrQ5F9CZetXO0pKusx+tw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UKMUot/qovvK1WWlh45qwcDBlAgVRXTuQtWCTRWBHBwObXDfB3RyA5ZgJQ0PZAetS
	 jv+8AtNlKYOCmPT2t2nDDcwq7p5pLA6U1nEJcwP9o7VpNQ7j0fbK+avg+DWhkq/tAx
	 dgOjoSd1K9Xvl3+mNLqidyWtUdYU3xKAosaj770xWXXphoyenWCj/qQWk1E4He51Lu
	 wXVHPd+ed4Plriyy0Fwmky4PanI9IobBii0hcJBgzXi1Ek6iX8bXMQGih5C5mXtDpU
	 VfQVJhmgkiWYADQPrtDWGXXlw8DFWRerjDBOQqABLfphmUxIy/nbduZfqzyLtTGEsq
	 e3VzUc6TUNRDg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B672E40423;
	Mon, 23 Feb 2026 21:52:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haowen Hu <srcres258@furdevs.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Haowen Hu
 <srcres258@furdevs.cn>
Subject: Re: [PATCH 2/2] docs/zh_TW: remove trailing space
In-Reply-To: <20260220160201.41149-2-srcres258@furdevs.cn>
References: <20260220160201.41149-1-srcres258@furdevs.cn>
 <20260220160201.41149-2-srcres258@furdevs.cn>
Date: Mon, 23 Feb 2026 14:52:02 -0700
Message-ID: <875x7n3z7h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76653-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[furdevs.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E772F17DCA9
X-Rspamd-Action: no action

SGFvd2VuIEh1IDxzcmNyZXMyNThAZnVyZGV2cy5jbj4gd3JpdGVzOg0KDQo+IFJlbW92ZSBvbmUg
dHJhaWxpbmcgc3BhY2UgY2hhcmFjdGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIYW93ZW4gSHUg
PHNyY3JlczI1OEBmdXJkZXZzLmNuPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX1RXL2FkbWluLWd1aWRlL1JFQURNRS5yc3QgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL2FkbWluLWd1aWRlL1JFQURNRS5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9hZG1pbi1ndWlkZS9SRUFETUUucnN0DQo+IGlu
ZGV4IDZlODlkMTYwODYzOS4uZmUzNjQ1Yjc5NTJlIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9hZG1pbi1ndWlkZS9SRUFETUUucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL2FkbWluLWd1aWRlL1JFQURNRS5yc3QNCj4g
QEAgLTMzLDcgKzMzLDcgQEAgTGludXjlhafmoLg2LnjniYjmnKwgPGh0dHA6Ly9rZXJuZWwub3Jn
Lz4NCj4gIA0KPiAgICDpm5bnhLZMaW51eOacgOWIneaYr+eIsjMy5L2N55qEeDg2IFBD5qmf77yI
Mzg25oiW5pu06auY54mI5pys77yJ6ZaL55m855qE77yM5L2G5LuK5aSp5a6D5Lmf6IO96YGL6KGM
5ZyoDQo+ICAgIO+8iOiHs+Wwke+8iUNvbXBhcSBBbHBoYSBBWFDjgIFTdW4gU1BBUkPoiIdVbHRy
YVNQQVJD44CBTW90b3JvbGEgNjgwMDDjgIFQb3dlclBD44CBDQo+IC0gIFBvd2VyUEM2NOOAgUFS
TeOAgUhpdGFjaGkgU3VwZXJI44CBQ2VsbOOAgUlCTSBTLzM5MOOAgU1JUFPjgIFIUCBQQS1SSVND
44CBSW50ZWwgDQo+ICsgIFBvd2VyUEM2NOOAgUFSTeOAgUhpdGFjaGkgU3VwZXJI44CBQ2VsbOOA
gUlCTSBTLzM5MOOAgU1JUFPjgIFIUCBQQS1SSVND44CBSW50ZWwNCj4gICAgSUEtNjTjgIFERUMg
VkFY44CBQU1EIHg4Ni02NCBYdGVuc2HlkoxBUkPmnrbmp4vkuIrjgIINCg0KSSBoYXZlIGFwcGxp
ZWQgdGhpcyBvbmUuDQoNCmpvbg0K

