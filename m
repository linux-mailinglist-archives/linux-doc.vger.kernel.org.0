Return-Path: <linux-doc+bounces-86394-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BbSIzu5/Wm4hwAAu9opvQ
	(envelope-from <linux-doc+bounces-86394-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 12:21:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B14F4F2A
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 12:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FE1F3026F1D
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 10:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8952DAFA9;
	Fri,  8 May 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxXcNDWD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29637268D
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235662; cv=none; b=jsEoDHUG/k9euMtEGszeTZKGl8dYzYcqq5h6yr/2v8hn6OEU9y6BjWEvh2NJw+PzZDWUtBPRlS86D1hIC9vlJhY/r/DhYOLtMvex8Ysxsu5qkNKIXAh/QYShLrj0xy8zqpPN4UDQGHK8SPadkbmBVSKKeoztpa0r4eK5eVFZifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235662; c=relaxed/simple;
	bh=3jcqc+/gUzleI8Wi5ukl5J/EPADm702T7CnpcFWRUOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFs45UAzEzr/KCQSKxZXwOMQ69rQwX1mTJjwxQY1RyFOgp9jwb3mivYoY9T9fst2fMuvaBAJ+BllC7M8nF29yBo58i+zs1kFYUZgVtppzWG5QpzDaFqrUmjotU2Fp/9rkD8NVhEp/hssXUcrGujbL7YXsv69XhHDqu7J+3GWyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxXcNDWD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778235661; x=1809771661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3jcqc+/gUzleI8Wi5ukl5J/EPADm702T7CnpcFWRUOg=;
  b=WxXcNDWDYrVniE1UAoKi9BvUe+Pdzpmoqi/pufZgLmDQ9PPH0bnFRHbM
   0+7L3IQSP7f13mZ/wh65YlP/CKOlk4+uQDZ6VrgKX+tdCCqacHZp4wGCq
   ZXFxTBnJ3NYGUBZn5SUhhgcjp6J4ZS/DmPtMVa3SP7MXPCl39FA7RntzB
   C4xD5BPgrwhrtQd+vhVqkVZaXPt2uYeDYgC3O6WPx/56RUWAD5Sby3ZlN
   NB53PzpFwKuaRHIWb+y+jdmEtcTiN31RUCRXuSfNyqaFrb2jVu/mFbkdC
   pHDHTm4A3zWjfjTaexcRumWByfB3+orMkh340TiL1TscmzlXMPU589j5O
   A==;
X-CSE-ConnectionGUID: q8TCpM/tTFSTHiNZdOUtBw==
X-CSE-MsgGUID: /TKd9S80QlWufpsMuaNF5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79055455"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79055455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:21:00 -0700
X-CSE-ConnectionGUID: lMbkoIwSR/+VvLUyv6+IJg==
X-CSE-MsgGUID: 0hSwl9kSQ5CC7H8GcYPdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230333917"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:20:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: rodrigo.vivi@intel.com,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/3] drm/i915: reorganize display documentation
Date: Fri,  8 May 2026 13:20:46 +0300
Message-ID: <cover.1778235406.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F13B14F4F2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86394-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Move Intel display documentation under Documentation/gpu/intel-display,
and reorganize into smaller documents. There's lots of room for
improvement, but it's a start.

I intend to merge this through drm-intel-next, as it's fairly isolated.

BR,
Jani.

Jani Nikula (3):
  Documentation/gpu: add dedicated documentation for Intel display
  Documentation/gpu: use === for Intel display section heading
    underlines
  Documentation/gpu: add remaining DOC: comments to Intel display
    documentation

 Documentation/gpu/drivers.rst                 |   1 +
 Documentation/gpu/drm-kms.rst                 |   3 +
 Documentation/gpu/i915.rst                    | 202 +-----------------
 .../gpu/intel-display/async-flip.rst          |   8 +
 Documentation/gpu/intel-display/atomic.rst    |  11 +
 Documentation/gpu/intel-display/audio.rst     |  23 ++
 Documentation/gpu/intel-display/casf.rst      |   8 +
 Documentation/gpu/intel-display/cdclk.rst     |  11 +
 Documentation/gpu/intel-display/cmtg.rst      |   8 +
 Documentation/gpu/intel-display/dmc.rst       |  26 +++
 Documentation/gpu/intel-display/dpio.rst      |   8 +
 Documentation/gpu/intel-display/dpll.rst      |  14 ++
 Documentation/gpu/intel-display/drrs.rst      |  11 +
 Documentation/gpu/intel-display/dsb.rst       |  11 +
 Documentation/gpu/intel-display/fbc.rst       |  11 +
 .../gpu/intel-display/fifo-underrun.rst       |  11 +
 .../gpu/intel-display/frontbuffer.rst         |  14 ++
 Documentation/gpu/intel-display/hotplug.rst   |  11 +
 Documentation/gpu/intel-display/index.rst     |  44 ++++
 Documentation/gpu/intel-display/plane.rst     |  11 +
 Documentation/gpu/intel-display/psr.rst       |  11 +
 Documentation/gpu/intel-display/snps-phy.rst  |   8 +
 Documentation/gpu/intel-display/vbt.rst       |  14 ++
 Documentation/gpu/xe/index.rst                |   5 +
 24 files changed, 290 insertions(+), 195 deletions(-)
 create mode 100644 Documentation/gpu/intel-display/async-flip.rst
 create mode 100644 Documentation/gpu/intel-display/atomic.rst
 create mode 100644 Documentation/gpu/intel-display/audio.rst
 create mode 100644 Documentation/gpu/intel-display/casf.rst
 create mode 100644 Documentation/gpu/intel-display/cdclk.rst
 create mode 100644 Documentation/gpu/intel-display/cmtg.rst
 create mode 100644 Documentation/gpu/intel-display/dmc.rst
 create mode 100644 Documentation/gpu/intel-display/dpio.rst
 create mode 100644 Documentation/gpu/intel-display/dpll.rst
 create mode 100644 Documentation/gpu/intel-display/drrs.rst
 create mode 100644 Documentation/gpu/intel-display/dsb.rst
 create mode 100644 Documentation/gpu/intel-display/fbc.rst
 create mode 100644 Documentation/gpu/intel-display/fifo-underrun.rst
 create mode 100644 Documentation/gpu/intel-display/frontbuffer.rst
 create mode 100644 Documentation/gpu/intel-display/hotplug.rst
 create mode 100644 Documentation/gpu/intel-display/index.rst
 create mode 100644 Documentation/gpu/intel-display/plane.rst
 create mode 100644 Documentation/gpu/intel-display/psr.rst
 create mode 100644 Documentation/gpu/intel-display/snps-phy.rst
 create mode 100644 Documentation/gpu/intel-display/vbt.rst

-- 
2.47.3


