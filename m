Return-Path: <linux-doc+bounces-90882-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AOoEGzwuIWrLAAEAu9opvQ
	(envelope-from <linux-doc+bounces-90882-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:50:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5D63DBCB
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 09:50:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ioFbu4NV;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90882-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90882-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB1AF300622F
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 07:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1837B3CF049;
	Thu,  4 Jun 2026 07:50:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516BD315D58;
	Thu,  4 Jun 2026 07:50:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559414; cv=none; b=BVhHD+GI4PSxzEPqLl+cF76s/tZlM9Pw1WIZPCmGYS70EV5HhGWbPM18dZ63riSTy5oS6SWeG20I4SIXO7qIKz94D/8wyC2WhcN2XCKoUywtWkkPIXr7LNHUzkHDpA3XKCh1Tq59CTot0OZPJQ+e3T2aYB9UmsAoHLnPLUwWmW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559414; c=relaxed/simple;
	bh=xXAo7JA/FCQGU0PydG/CbstStee8P3CnLDdGkdFqfkE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U+aMcWNAfrmUdzhh0asljeKW5ff0bYdfDk5J6XfSoQlVWsDvCeq//Iz0mr5Odu0SsfQbJKthzQ8ypP1eLG6NeRI5bsLeDw+hWnE4gbrB2HJDrTslBYx0XrtAzUvhAlUc0bJdF0HEdM0heymh4UyJvIBT9Oqj0H06EkXvvyh7MJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ioFbu4NV; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iKhnmKKSbhjeNdqT2fB30yYTWXHZcg0QMpTiu5anmd0=;
	b=ioFbu4NVRgf3LNPhc//0xFgLW/sRh9rqxYVVddoZbjMClBRr/6NDkF7bkGHmFpANOSXBcY9Vk
	ZaPiu9leZp97LBHEsrw8FVfsuFTOdQdikbm19YHu3yVHJFDpEQkrPpfGeLZvcP9svaIPVA/Q3Cl
	w1tvAPATCnOb+95EV2ScSfM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gWGjy27Cpz1prPH;
	Thu,  4 Jun 2026 15:42:14 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 54E3D40561;
	Thu,  4 Jun 2026 15:50:07 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:07 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:05 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>,
	<shenyang39@huawei.com>, <gaozhihao6@h-partners.com>,
	<yuzhichengcheng@h-partners.com>, <liyihang9@h-partners.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <wuyifan50@huawei.com>,
	<liusizhe5@huawei.com>
Subject: [PATCH 00/10] perf hisi-ptt: Enhance TLP packet decoder with field-level parsing and versioning
Date: Thu, 4 Jun 2026 15:49:55 +0800
Message-ID: <20260604075005.2219785-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn200012.china.huawei.com (7.202.194.135)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bhelgaas@google.com,m:yangyccccc@gmail.com,m:jic23@kernel.org,m:john.g.garry@oracle.com,m:will@kernel.org,m:james.clark@linaro.org,m:mike.leach@arm.com,m:leo.yan@linux.dev,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:wangyushan12@huawei.com,m:shenyang39@huawei.com,m:gaozhihao6@h-partners.com,m:yuzhichengcheng@h-partners.com,m:liyihang9@h-partners.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linuxarm@huawei.com,m:prime.zeng@hisilicon.com,m:fanghao11@huawei.com,m:wuyifan50@huawei.com,m:liusizhe5@huawei.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90882-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[goodmis.org,kernel.org,efficios.com,lwn.net,linuxfoundation.org,google.com,gmail.com,oracle.com,linaro.org,arm.com,linux.dev,infradead.org,redhat.com,linux.intel.com,intel.com,huawei.com,h-partners.com];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[37];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liusizhe5@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,huawei.com:mid,huawei.com:from_mime,huawei.com:dkim];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F5D63DBCB

This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
decoder in perf to provide detailed field-level parsing of TLP headers
based on message type, and adds a versioning mechanism for backward
compatibility.
The original decoder only prints raw hex values with generic field
names for each DW, without classifying TLP types or decoding
DW2/DW3 fields according to the hardware-defined packet format.
Patch overview:
  Patches 1-2: Bug fixes
    - Fix spelling/abbreviation errors (FIELD_LENTH, kpt_desc)
    - Fix DW0 bit field ordering and DW hex value printing
  Patches 3-7: Refactoring for field-level parsing
    - Rename union and add named struct member for multi-DW reuse
    - Abstract trace buffer/offset into struct hisi_ptt_pkt_buf
    - Complete missing field name entries in 4DW/8DW tables
    - Extract raw data printing into function
    - Unify 4DW/8DW HEAD0 printing into hisi_ptt_print_head0()
  Patch 8: TLP message type classification
    - Parse Format/Type from DW0 to classify packets as
      MWr/Msg/Atomic/IO/Cfg/Cpl
  Patch 9: Field-level DW2/DW3 parsing
    - Decode DW2 fields for MWr/Msg/Atomic/IO TLPs
    - Decode DW3 fields for Completion and Configuration TLPs
  Patch 10: Version compatibility
    - Add V1/V2 version in auxtrace info to distinguish old
      (generic field names) from new (detailed field parsing)
      trace data, with backward compatibility for V1 files

Sizhe Liu (10):
  perf hisi-ptt: Fix spelling and abbreviation errors
  perf hisi-ptt: Fix PTT trace TLP Header parsing
  perf hisi-ptt: Rename hisi_ptt_4dw union for reuse
  perf hisi-ptt: Abstract trace data buf and offset
  perf hisi-ptt: Complete the field names for 4DW and 8DW packets
  perf hisi-ptt: Extract the raw data printing part
  perf hisi-ptt: Merge 4DW and 8DW HEAD0 printing
  perf hisi-ptt: Add parsing of supported message types
  perf hisi-ptt: Add field-level parsing for header DW2/DW3
  perf hisi-ptt: Add decoder version compatibility

 Documentation/trace/hisi-ptt.rst              |  28 +-
 tools/perf/arch/arm64/util/hisi-ptt.c         |   2 +
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 352 +++++++++++++++---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  27 +-
 tools/perf/util/hisi-ptt.c                    |  46 ++-
 tools/perf/util/hisi-ptt.h                    |   4 +-
 6 files changed, 365 insertions(+), 94 deletions(-)

-- 
2.33.0


