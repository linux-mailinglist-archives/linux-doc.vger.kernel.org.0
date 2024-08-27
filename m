Return-Path: <linux-doc+bounces-23976-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF5C9618CD
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 22:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845811F24480
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 20:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEC51D414F;
	Tue, 27 Aug 2024 20:52:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082131D3195
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724791922; cv=none; b=QMPVuc1UaHPeExpcoG/9diAbcjsr3YLJKs0yn2dt9v7fXWlamxDa11XIax9W2wn1c4haK2dor/xaFXfyMWNDxp+DgADiKHKo/Ga0edKtNtoWNbBYSGpGGqyav9iQttoQRXBi6X9ipH5SS62KbFL+l2zVpTqAgv8y4uPoK/FzbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724791922; c=relaxed/simple;
	bh=nPnLv1S6hrrNg1WtwqiCD8Syxq1iqxffEnKMxoXx9Ts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZrVsh3eMmAABqYkS/A7IINE0cWgWVq9c3ETAcMKZYdf6hqUBdAPpJKygXbdX2CKfTfcyTRfycteEt0UvWCZqjpNSyUmSfVUE8H8DJ/l2usYt9ra6lNHKg4HmDsFCUBJfroQ1qlnpwdWDslRcRGhmB/Kox3jQU0tyCXFgT62duIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sj3AK-0004aF-P7; Tue, 27 Aug 2024 22:51:48 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sj3AJ-003VwC-1l; Tue, 27 Aug 2024 22:51:47 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sj3AI-00Cxwt-1f;
	Tue, 27 Aug 2024 22:51:46 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH v11 0/3] usb: gadget: 9pfs transport
Date: Tue, 27 Aug 2024 22:51:40 +0200
Message-Id: <20240116-ml-topic-u9p-v11-0-b4890e06733a@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFw8zmYC/33SzW7DIAwH8FepOI+Vb8JOe49pB8CmRWqTKEmjT
 lXefSTXMY62/v5ZlvwiM04ZZ/JxepEJ1zznoS8F528nEq++vyDNUBpEMKEY54beb3QZxhzpw42
 0c1pYpSXDwEkZCX5GGibfx+s+dL/db+cjfS7pPTBOmPLzWPj1Xeprnpdh+jn2r3zv/rNp5ZRRD
 12UzCTnFX6O2F8eyzT0+fkOSHZtFS1BFCEoE0PSTjgjqoJsCbII0QgvDcYInlcF1RJUEawQCKI
 LzEP9Ct0SdBE0AvMBtMSkq4JpCaYIxmlnLVgDKVUF2xJsEaTniJisTaF+RdcSuiIo5tBoF70Cq
 AquJbgiOAlWJmWDNaEqcNZ8Kbb/VKcToI8i6r8fsW3bL7Nos1kjAwAA
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, v9fs@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, kernel@pengutronix.de, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Jan Luebbe <jlu@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6028;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=nPnLv1S6hrrNg1WtwqiCD8Syxq1iqxffEnKMxoXx9Ts=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmzjxdhdPkW9Rpll+lg4CJjMup6wA34DMmFcLCv
 xsWOnzDv7CJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZs48XQAKCRC/aVhE+XH0
 q42sD/99KcJOLqRlp6BqWpTxYszQBj5rGbHFb0M8CTpz719Iakn/2KbgLLoq/b9ssQqU/OvdcYy
 zgxYkLPM7EilmCvASItlGseHRguHMBRejnjk4mtrJ7xvbeJ/Rt52UOzMc0lF6eCGOaVBVftquxE
 5byeYaexIMgss4QW21cS6xGvtPmBpBDugaR5rAsLlf7Y4ajNhcwPo61OTJP7LnoYbYJlxPEyonq
 j7xGFIhRSav7W3jBnYSzafRw/HMmcjgarbb/KWOeEgfDMLQSacvyyW+2EmVCYkahTUXa8kBYV/0
 zAFSrFvKYUwy3wbcBeHDV696SvJqPvdlcIvMcxRx3FXoCId7aTjmaEDdZO8ks4UfEV6GZlisGgY
 zjc/MtgQLWL7741DNLtp14FHpRBIz1hB3g1tWm+0nvhFaA4m8biCo6kql17rGxDE5G7ZdlsLyhC
 ruwHAQJBun/8iC/CcsY+YD6zA2+LODEe8nCk3BAwJAQnTZ6UiyM8Von1ZLIeBemxTtdm79fTMkd
 d52XrpH8YKi2NC6FMT6DiNOJOe+oeOcRbJfYqTbBfGBCa/DL10mKJt7XcrbNaM4+KYfqi2CT2bG
 RWsItPEFQwa/B/Vm7dUpAgryp1jA9rPPDSRngSLq85cV8ry3k3fMSxEMfREJWdhScZYn81d/2yt
 Fn7lMDvyCFfaNXQ==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

This series is adding support to mount usb hostside exported 9pfs
filesystems via the usb gadget interface. It also includes a simple tool
(p9_fwd.py) to translate an tcp 9pfs transport and reuse it via the usb
interface.

    +--------------------------+    |    +--------------------------+
    |  9PFS mounting client    |    |    |  9PFS exporting server   |
 SW |                          |    |    |                          |
    |   (this:trans_usbg)      |    |    |(e.g. diod or nfs-ganesha)|
    +-------------^------------+    |    +-------------^------------+
                  |                 |                  |
                  |                 |           +------v------+
                  |                 |           |  p9_fwd.py  |
                  |                 |           +------^------+
                  |                 |                  |
------------------|------------------------------------|-------------
                  |                 |                  |
    +-------------v------------+    |    +-------------v------------+
    |                          |    |    |                          |
 HW |   USB Device Controller  <--------->   USB Host Controller    |
    |                          |    |    |                          |
    +--------------------------+    |    +--------------------------+

The USB host exports a filesystem, while the gadget on the USB device
side makes it mountable.

Diod (9pfs server) and the forwarder are on the development host, where
the root filesystem is actually stored. The gadget is initialized during
boot (or later) on the embedded board. Then the forwarder will find it
on the USB bus and start forwarding requests.

In this case the 9p requests come from the device and are handled by the
host. The reason is that USB device ports are normally not available on
PCs, so a connection in the other direction would not work.

One use-case is to use it as an alternative to NFS root booting during
the development of embedded Linux devices.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Changes in v11:
- fixed the include guard in func_utils.h
- Link to v10: https://lore.kernel.org/r/20240116-ml-topic-u9p-v10-0-a85fdeac2c52@pengutronix.de

Changes in v10:
- fixed reset of tx req context in complete handler
- added suggestions from Cristoph JAILLET from v9 review
- Link to v9: https://lore.kernel.org/r/20240116-ml-topic-u9p-v9-0-93d73f47b76b@pengutronix.de

Changes in v9:
- solved the error return path by using wait_for_completion instead of
  running in the usb complete callback in a loop
- by using wait_for_completion solves the req_lock
- using req->context instead of using a state variable
- Link to v8: https://lore.kernel.org/r/20240116-ml-topic-u9p-v8-0-409e659ca4dd@pengutronix.de

Changes in v8:
- this time really added the req_lock spinlock
- Link to v7: https://lore.kernel.org/r/20240116-ml-topic-u9p-v7-0-3a1eeef77fbe@pengutronix.de

Changes in v7:
- added back the req_lock spinlock
- Link to v6: https://lore.kernel.org/r/20240116-ml-topic-u9p-v6-0-695977d76dff@pengutronix.de

Changes in v6:
- fixed the python script not to have path set by default
- improved the lock init
- fixed usb9pfs status change to connected
- Link to v5: https://lore.kernel.org/r/20240116-ml-topic-u9p-v5-0-5ed0abd53ef5@pengutronix.de

Changes in v5:
- fixed lockup in mount -> remount -> monut scenario
- improved p9_fwd transport script with more options
- Link to v4: https://lore.kernel.org/r/20240116-ml-topic-u9p-v4-0-722ed28b0ade@pengutronix.de

Changes in v4:
- reworked the naming scheme to be set by the configfs instance
- added conn_cancel function to properly stop the transfers
- ensured that umount -f will work even when the host side has crahed
- added all the review feedback from Andrzej Pietrasiewicz
- Link to v3: https://lore.kernel.org/r/20240116-ml-topic-u9p-v3-0-c62a36eccda1@pengutronix.de

Changes in v3:
- dropped patch "usb: gadget: legacy: add 9pfs multi gadget" as discussed with gregkh
- Link to v2: https://lore.kernel.org/r/20240116-ml-topic-u9p-v2-0-b46cbf592962@pengutronix.de

Changes in v2:
- improved the commit messages
- introduced an patch to move the header u_f.h to include/linux/usb to compile usb gadget functions treewide
- moved usbg gadget function to net/9p/
- adderessed several comments in function driver, like the cleanup path and kbuild errors
- improved the documentation in Documentation/filesystems/9p.rst
- Link to v1: https://lore.kernel.org/r/20240116-ml-topic-u9p-v1-0-ad8c306f9a4e@pengutronix.de

---
Michael Grzeschik (3):
      usb: gadget: function: move u_f.h to include/linux/usb/func_utils.h
      net/9p/usbg: Add new usb gadget function transport
      tools: usb: p9_fwd: add usb gadget packet forwarder script

 Documentation/filesystems/9p.rst                   |  58 +-
 drivers/usb/gadget/configfs.c                      |   2 +-
 drivers/usb/gadget/function/f_fs.c                 |   2 +-
 drivers/usb/gadget/function/f_hid.c                |   2 +-
 drivers/usb/gadget/function/f_loopback.c           |   2 +-
 drivers/usb/gadget/function/f_midi.c               |   2 +-
 drivers/usb/gadget/function/f_midi2.c              |   2 +-
 drivers/usb/gadget/function/f_sourcesink.c         |   2 +-
 drivers/usb/gadget/u_f.c                           |   2 +-
 .../gadget/u_f.h => include/linux/usb/func_utils.h |   8 +-
 net/9p/Kconfig                                     |   6 +
 net/9p/Makefile                                    |   4 +
 net/9p/trans_usbg.c                                | 959 +++++++++++++++++++++
 tools/usb/p9_fwd.py                                | 243 ++++++
 14 files changed, 1281 insertions(+), 13 deletions(-)
---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240116-ml-topic-u9p-895274530eb1

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


