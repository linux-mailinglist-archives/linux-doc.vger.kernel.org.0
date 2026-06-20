Return-Path: <linux-doc+bounces-92992-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gcn5EV/1Nmo9HAcAu9opvQ
	(envelope-from <linux-doc+bounces-92992-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA26A9ADD
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 22:17:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rcpassos.me header.s=purelymail1 header.b=CIt57S4X;
	dkim=pass header.d=purelymail.com header.s=purelymail1 header.b=gtq0B14m;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92992-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92992-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=rcpassos.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8CB2300F16F
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2681F12E0;
	Sat, 20 Jun 2026 20:17:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258322D7B9
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 20:17:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781986653; cv=none; b=OqAoOl7UFGHGBsdvwazm3macG+vqUS5z9W3tA2c7/6Qo4vh3oChC0OpClsSqswDbn0EB0x/gWcLjnwajFUEoAFjvEMlqMD94+dAmS2Ot2cEXrtSm57RPjEJbXtlp0jKTYGoBFwm51ExOySZFOOJkj2f6c7w6LBizJIzgi8L7phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781986653; c=relaxed/simple;
	bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCmxvd4xjrsHsQ2tBWnurZe245/Q0FKiBtuBHNk4zlLNOxgNIyt5lnNKb2CWz+ZsLT/akFhi2tdTJYQ/Ai740AubNfD0K6VgD/7gyTdmL4FZLksIZZIdPU/x/h3zy/FXMjyQJ8SLeM38DQaxUt5yNPgT8XOkJXG6aCmP43fY5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=CIt57S4X; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=gtq0B14m; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=CIt57S4XcAT/O14mvE4u5STcUroQdpaT0+h5543wUpIOMFgdb+/1kIZunGoEmBiqoJW46G5OD7Oww7UXsC/HGNpkyO+4Uyn5rkI1aIOD8pWtbw6GFUodZK5ttDL3qJ/nyIoZbstOalGkd483xEurYrTwIriE/PPCR3Yeb3SzKMV+RdRVZd3hS/qWrMSje2LARkPGOUHvemqS79shtGir4+VIj7Za+YS4Fh9L9p8wrqDiLqDNY086J1eA1x8I8uNdpXH9qs28JHnOn7mEgtgK9zkXVNvr7PPjVGkWC6lAsGGTI6C09yVnTOs1TCRGIWIYrzx6uChu+UeHtiZW+TaBEg==; s=purelymail1; d=rcpassos.me; v=1; bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=gtq0B14mucXuvbZh0hvZsHdh2UleqhBRP5YyNQ/Clq7bY7fjokrcVaj6yD5YBcqYJCgLJA4RMOG2p/9LE3YaedNRiJ/g5H0QzB4UA52kmSB15FpxodwQDU4IR9hH/DalCSueiKh0SIs87TV3FB7fXz44LDsX34GAp2u7FoVWHw816vZase9C2CHAgdL4DrHHnkojmNzmsg5NQJAOk93kNswVzpWbBXHlIuZQtQKHzyktd91OupStfRagwVhr7tqU+Qev6Agr7m8I+MXy1WNMdMaKi6OLFgBJc1K6pXtJ8NozA9xxyVAdxguXAd2zVc0pddJs+aBPpfXrOuXA6G9z1A==; s=purelymail1; d=purelymail.com; v=1; bh=fDCFrf3ey1Tb10UufhoMb9Qf+gcO8zU8+mdg8cYOTjQ=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1982731664;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 20:17:30 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: [PATCH 2/3] Documentation: xe_drm: fix chars used for subsection
Date: Sat, 20 Jun 2026 17:16:34 -0300
Message-ID: <20260620201732.94141-3-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620201732.94141-1-rafael@rcpassos.me>
References: <20260620201732.94141-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rcpassos.me,reject];
	R_DKIM_ALLOW(-0.20)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92992-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[rcpassos.me:+,purelymail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,purelymail.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rcpassos.me:dkim,rcpassos.me:email,rcpassos.me:mid,rcpassos.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8FA26A9ADD

Equal signs are reserved for document tiles"=3D"
this file docs gets imported by driver-uapi.rst,
and the page title is defined there.

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---
 include/uapi/drm/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..4dfb30e6c8a8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2537,21 +2537,21 @@ struct drm_xe_exec_queue_set_property {
  * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interfac=
e specification.
  *
  * Node Registration
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * -----------------
  *
  * The driver registers DRM RAS nodes for each error severity level.
  * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ER=
ROR_SEVERITY_NAMES maps
  * node-id to node-name.
  *
  * Error Classification
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------------
  *
  * Each node contains a list of error counters. Each error is identified b=
y a error-id and
  * an error-name. enum drm_xe_ras_error_component defines the error-id, wh=
ile
  * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
  *
  * User Interface
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------
  *
  * To retrieve error values of a error counter, userspace applications sho=
uld
  * follow the below steps:
--=20
2.53.0


