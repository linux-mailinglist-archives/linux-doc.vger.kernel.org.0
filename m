Return-Path: <linux-doc+bounces-15575-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E948B8D57
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 17:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FCF41F21B77
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 15:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAC012FB13;
	Wed,  1 May 2024 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RdClgPHI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE0A4F898
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714578201; cv=none; b=JexjJqnBOYGVEO5H2m7tNu3heOZvfWTA6+x3L7BBkCkCMKfMfnqKP0gnhUz77KsbN1nxUhATsG6TVy5jdeKWYxWdfiQ+Luu7J4/EI5ImYIJQ8Ts7JSkCFGHzsQ6MFCZBCg7n2d5zu6XmhuVNwUGmnizALycizsZksB4J+9MI62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714578201; c=relaxed/simple;
	bh=l18OjoF9z9/KJIkQeFHeAoDUNt5M0OaJGhX0AhKmSsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MoQ2xt/j68rPQonuzLku05dizPDRhu8YiLGc8a2VRWpBeWcQ1tF6d3CoHyrk/7T+okpNRXm7L0nbcAICYxQ+uIct4FkdgbxSFYXwrVUSWHm6p4O830mdfrIWiRINKFzXjbNZVGj3WVbEkW0qXXe6+flUduDcrdqo5Z7mMwD7OQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RdClgPHI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso4705738b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714578198; x=1715182998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FY1JyFaDnQGTqxfQ2HctDPUgwCZwwkdXbXVkbs7t8UM=;
        b=RdClgPHIUybVdXYZDa00LyPqBFKzbNlZQxe1ubNsNGf6G9+uUIJDQFQbEIRJnrr7ng
         saJTzz60/yugVTU30ABoh9mJyOVgYXL313YN27Hpm4pjQjrz6Ix6c23qidxajT4JF+N0
         9eJrAhWbjOgv/HHVeN0NaURGB+/WCwMWfoFyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714578198; x=1715182998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY1JyFaDnQGTqxfQ2HctDPUgwCZwwkdXbXVkbs7t8UM=;
        b=FRD+K393/ijt+uE/0etku5hsFV4wHUicF9yOj43bVeUJC9vWq+ObQ3z+kqc+rJ0XMn
         8gl7n+5H9FAMW7Z3XMzJaRGN5f3wZMQBMbcSbxAhjyGfJsLdVJbfdaOr23wxIaq/CaYd
         GE450ITuDeuQfajCCW07xfA1JfjPvNrUEWDIfEh6O+NTNElFJFNF0FCkGfCrLLTloibU
         LBGnzlUP4c0SZC6jS2J8vuD54Kp1SxUdoupaaGjpiqGU/7KymDgzYl+d6S9R8kNffGyc
         GwS5ypg57jd/TQe4XtrxgH7EILurnzwAe2imo6sSqWXyzU5JVe47BpBrPAcnxHzmpIT/
         bkRw==
X-Forwarded-Encrypted: i=1; AJvYcCWMIcDLD98fClIAXhtrICWbxKAaJico4HhksAwLpNA2rpT4OIvjbw+W0dZX6+1muSjxxtcyp2HTE09V7mpro/vzBIu88Wfb2LJp
X-Gm-Message-State: AOJu0Yz0UoGa0Ej0j8yN9KI6hNgEcsoRXhIc2u3mTOKVtA7CTFUaiIpu
	GvK4siNfrnIAvvy1bBXx6928FoSlshzCsGnmbtW594zo4sBpzf6uolGn4asirQ==
X-Google-Smtp-Source: AGHT+IG5IE9X8NYR+TK2tL4Nw0zNG4DxZx7ua7w9u0B4daBN4S28dT+xY2gFWEmWj9/+wdCLMHCxxA==
X-Received: by 2002:a05:6a20:3aaf:b0:1ae:3f36:28d3 with SMTP id d47-20020a056a203aaf00b001ae3f3628d3mr3648768pzh.49.1714578198442;
        Wed, 01 May 2024 08:43:18 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:e886:8de:19a2:55b0])
        by smtp.gmail.com with ESMTPSA id fb12-20020a056a002d8c00b006f3ec69bc09sm7717924pfb.75.2024.05.01.08.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 08:43:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
	Hsin-Yi Wang <hsinyi@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Joel Selvaraj <jo@jsfamily.in>,
	lvzhaoxiong@huaqin.corp-partner.google.com,
	Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] drm/mipi-dsi: Reduce bloat and add funcs for cleaner init seqs
Date: Wed,  1 May 2024 08:41:03 -0700
Message-ID: <20240501154251.3302887-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The consensus of many DRM folks is that we want to move away from DSI
drivers defining tables of init commands. Instead, we want to move to
init functions that can use common DRM functions. The issue thus far
has been that using the macros mipi_dsi_generic_write_seq() and
mipi_dsi_dcs_write_seq() bloats the driver using them.

While trying to solve bloat, we realized that the majority of the it
was easy to solve. This series solves the bloat for existing drivers
by moving the printout outside of the macro.

During discussion of my v1 patch to fix the bloat [1], we also decided
that we really want to change the way that drivers deal with init
sequences to make it clearer. In addition to being cleaner, a side
effect of moving drivers to the new style reduces bloat _even more_.

This series also contains a few minor fixes / cleanups that I found
along the way.

This series converts four drivers over to the new
mipi_dsi_dcs_write_seq_multi() function. Not all conversions have been
tested, but hopefully they are straightforward enough. I'd appreciate
testing.

NOTE: In v3 I tried to incorporate the feedback from v2. I also
converted the other two panels I could find that used table-based
initialization.

[1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid

Changes in v3:
- ("mipi_dsi_*_write functions don't need to ratelimit...") moved earlier.
- Add a TODO item for cleaning up the deprecated macros/functions.
- Fix spacing of init function.
- Inline kerneldoc comments for struct mipi_dsi_multi_context.
- Rebased upon patch to remove ratelimit of prints.
- Remove an unneeded error print.
- Squash boe-tv101wum-nl6 lowercase patch into main patch
- Use %zd in print instead of casting errors to int.
- drm/panel: ili9882t: Don't use a table for initting panels
- drm/panel: innolux-p079zca: Don't use a table for initting panels

Changes in v2:
- Add some comments to the macros about printing and returning.
- Change the way err value is handled in prep for next patch.
- Modify commit message now that this is part of a series.
- Rebased upon patches to avoid theoretical int overflow.
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
- drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
- drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prints
- drm/panel: boe-tv101wum-nl6: Convert hex to lowercase
- drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
- drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()

Douglas Anderson (9):
  drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
  drm/mipi-dsi: Fix theoretical int overflow in
    mipi_dsi_generic_write_seq()
  drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
    prints
  drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
  drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
  drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
  drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
  drm/panel: ili9882t: Don't use a table for initting panels
  drm/panel: innolux-p079zca: Don't use a table for initting panels

 Documentation/gpu/todo.rst                    |   18 +
 drivers/gpu/drm/drm_mipi_dsi.c                |  112 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 2792 +++++++++--------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c |  794 +++--
 drivers/gpu/drm/panel/panel-innolux-p079zca.c |  284 +-
 .../gpu/drm/panel/panel-novatek-nt36672e.c    |  576 ++--
 include/drm/drm_mipi_dsi.h                    |  101 +-
 7 files changed, 2451 insertions(+), 2226 deletions(-)

-- 
2.45.0.rc0.197.gbae5840b3b-goog


