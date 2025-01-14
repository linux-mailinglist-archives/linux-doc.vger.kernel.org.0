Return-Path: <linux-doc+bounces-35243-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73CA10DE2
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 18:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4D3F3A05C5
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 17:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CAE1DFD8B;
	Tue, 14 Jan 2025 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VRmylsW5"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C41C1F0C;
	Tue, 14 Jan 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876108; cv=pass; b=TPZObKU8wEpbN5kjXa+uRRIlMZiT5Pq6dAd1+LvfhBRjv7zpCEolzRb6zDWKQ3EWgBEq/lVQyNYcl9KNtphfeKMghCFBofFYuLWdEakZ8JAvCnTZ0hlFFTNcl5B0GLn/YyoZngimOIp6Ej8TC4NE55M+htFhAFIbpVsLBvDVxJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876108; c=relaxed/simple;
	bh=B30ic9T8R7k8kxp3FsTW6GHYAsHAaH5n3x2lNUOh7pM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=biwkkuzjKFgwKhw6qd7O7VYStA2+bU9fkBuBgPLC7SrhnxNbPsPs9SQhzg0vtP1FQwzihZblor8t7goSeASjpNMX9qegQ7itOVNA5pJvq0M9EXJ+Mari9jt+9JSFcdNWymALjTdRfLc5I+F2hKGJxHtHb7J558Q0fVLEstrAxxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=VRmylsW5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736876079; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Myl2IQ/fRgThvTKK3uNZ+rSbzf7tIe4LJMOa9oaxvtp+VDZM0uWZNrsJ5ZYdTOPbxKbnCdj/DyclWjug893mPzB5pYXI9eT1amIkFd8ABNGle3/2tqh0zHoU7KaOHsbsO/TkkCO6A2favM336UIL74Fe0VdCKENxctNqLc6xwa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736876079; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WjiKStZGgkgXZhDubvHVjeuv7oi6lQpDm9h7jMOxJAc=; 
	b=npqESOB6ZnTPIotpQZTSOZADfc6XdZPVSrlndG7Q56QoX+Iis5nikHZigYsMg6yJBfutBWuIZ5enTDYDbTU2pmDGLsmgdjiuoG766lvcVWOb2Z68qyIxDwU4WUkQ4XSHYx8BulaMVtswPD4VRXbw9WD2WZJeNmNJZhs9byWrw2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876079;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WjiKStZGgkgXZhDubvHVjeuv7oi6lQpDm9h7jMOxJAc=;
	b=VRmylsW5uBBFRqlNslQCZGHggaJQX23ok+JlrXCfzP1CpnMAWs+2FYWBox7dVnbx
	5VBbRBM4lMu7eWlKNO6NBfGqkbDMPBK+01YaUxjXzpzvNngCAQHype4LoFRX4D8a2vo
	qmzMgIaDYcQs/yKbNo80NGrKlTMIX5jbdk6AGXkw=
Received: by mx.zohomail.com with SMTPS id 1736876076559130.0275980885292;
	Tue, 14 Jan 2025 09:34:36 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] drm/panthor: Display size of internal kernel BOs through fdinfo
Date: Tue, 14 Jan 2025 17:33:59 +0000
Message-ID: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series enables display of the size of driver-owned shmem BO's that aren't
exposed to userspace through a DRM handle.

Discussion of previous revision can be found here [1].

Changelog:
v8:
 - Made print_size public and added prefix argument for drm_print_memory_stats
 - Updated documentation commit to reflect new name tags
 - Some minor polishing
v7:
 - Added new commit: mentions the formation rules for driver-specific fdinfo keys
 - Added new commit: adds a helper that lets driver print memory size key:value
   pairs with their driver name as a prefix.
 - Modified later commits to make use of the previous ones.
 - Deleted mentions of now unnecessary memory keys in the old revision.
v6:
 - Replace up_write witnh up_read, which was left out in the previous version
 - Fixed some minor comment and documentation issues reported by the kernel test robot
v5:
 - Replaced down_write semaphore with the read flavour
 - Fixed typo and added explicit description for drm-shared-internal in
 the fdinfo documentation file for Panthor.
v4:
 - Remove unrelated formating fix
 - Moved calculating overall size of a group's kernel BO's into
 its own static helper.
 - Renamed group kernel BO's size aggregation function to better
 reflect its actual responsibility.

[1] https://lore.kernel.org/dri-devel/20250108210259.647030-1-adrian.larumbe@collabora.com/

Adrián Larumbe (4):
  Documentation/gpu: Clarify format of driver-specific fidnfo keys
  drm/file: Add fdinfo helper for printing regions with prefix
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags

 Documentation/gpu/drm-usage-stats.rst   |  5 ++-
 Documentation/gpu/panthor.rst           | 10 +++++
 drivers/gpu/drm/drm_file.c              | 27 +++++++++----
 drivers/gpu/drm/panthor/panthor_drv.c   | 14 +++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 34 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 51 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  2 +
 include/drm/drm_file.h                  |  5 +++
 11 files changed, 169 insertions(+), 10 deletions(-)


base-commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2
-- 
2.47.1


