Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8D8BBA6C
	for <lists+linux-doc@lfdr.de>; Mon, 23 Sep 2019 19:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440155AbfIWR2C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Sep 2019 13:28:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:46288 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389338AbfIWR2B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A8AB8B021;
        Mon, 23 Sep 2019 17:27:59 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/12] drm/ast: Don't call ast_show_cursor() from ast_cursor_move()
Date:   Mon, 23 Sep 2019 19:27:43 +0200
Message-Id: <20190923172753.26593-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Separating the cursor's move() function from the show() function in
preparation of further rework of the cursor update code.

'Showing' the cursor from within the move() function is required to
update the cursor position.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6caa6ebfeaa8..a4cbf2d5ee0a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1236,6 +1236,7 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 	struct ast_private *ast = crtc->dev->dev_private;
 	int x_offset, y_offset;
 	u8 *sig;
+	u8 jreg;
 
 	sig = drm_gem_vram_kmap(drm_gem_vram_of_gem(ast->cursor_cache),
 				false, NULL);
@@ -1262,7 +1263,9 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
 
 	/* dummy write to fire HWC */
-	ast_show_cursor(crtc);
+	jreg = 0x02 |
+	       0x01; /* enable ARGB4444 cursor */
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
 
 	return 0;
 }
-- 
2.23.0

