Return-Path: <linux-doc+bounces-17075-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E88D1006
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 00:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2694B21BA0
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 22:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA98168C00;
	Mon, 27 May 2024 22:08:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAD1754B
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 22:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716847734; cv=none; b=NkAQEAWZp2Ly3Pp1VpJA4gbqR5NnRpGQku+w7+UVm3TSNmMXQ61TMrT38pDeaKlcQtw1xL4GrPxmcREEbvBnyMY+ZT28+qp0/wGHdaddaRvX+OUINRBw8sfG6MjmxyV1DYTz4J/r8F2+Uvj/g2rf21gs4xXBlypbrPQvZjYCW6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716847734; c=relaxed/simple;
	bh=H6U+eWUQikfOYCkQKk4sxdqm4T/OqhmsooC1md3a7JY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u/b+9mFCMtJTTXVCtzr7dxmWkKHhkiXn4u/7gl3hbannZjTr3jGNr9uEaLt1rnmoy5fSmtiuJUldPwKlOHCBE6E4QWG4IfXz169OGNybC1HsnJ7xURC1ocZNT+JyVA6rAsAY10WOPha7hw7KAQuWCTpiyoce4iOTkmIxgy+2nZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sBiWH-0003jX-OH; Tue, 28 May 2024 00:08:41 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sBiWE-003FHD-OY; Tue, 28 May 2024 00:08:38 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sBiWF-007MAH-0Y;
	Tue, 28 May 2024 00:08:38 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH v5 0/3] usb: gadget: 9pfs transport
Date: Tue, 28 May 2024 00:08:35 +0200
Message-Id: <20240116-ml-topic-u9p-v5-0-5ed0abd53ef5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQEVWYC/33PzY6DIBQF4FdpWJcpXJBKV32PSRf8XCuJogFrO
 ml896LbaV0ecu53wotkTAEzuRxeJOEcchhiCdXxQFxr4h1p8CUTYCAZ54r2HZ2GMTj60COtdQV
 nWQmGlpNyYk1GapOJrl2P+q7vTlv7VNprYUzYhOe293sruQ15GtLfNj/z9fXL0swpo8bXTjDVa
 CPxOmK8P6Y0xPD88UhWbYY9AYpgpXK2qTRoBR8FsSeIIjgFRih0zhv+UZB7gizCGQA91JYZ//8
 Xy7K8AZ/2jJqUAQAA
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: v9fs@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Jan Luebbe <jlu@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4742;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=H6U+eWUQikfOYCkQKk4sxdqm4T/OqhmsooC1md3a7JY=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmVQRlrFD/Ithlu3ZmZKyMifhKrn0B0MTWVSOTA
 2Mdb6WRvhCJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZlUEZQAKCRC/aVhE+XH0
 q5XiEACxtsWRVQSsnHfHg45OzYdHkH3rkcLmWBAppGtOicjFSJN5jbgrI5mGzGhJKVyigwtIzuM
 JKzJlzL196kF/FQmaW0MW7YAYrnxTa5HiSoJBdDDNl8Pdtb8CcR7bQ8L7rNPe9hWcgSVN+C/zF1
 aZlg/qfrhHZDOgFbwUrGv07Kv1v8QrWW1KBsW7lN/DaXjH+obRSthtRelqJOldQ0NdeDmDNC0t6
 pufQ5FyVtRN0EM+66wRPolXs5pt6gfEUSYEggkfMwukAZpdcTdHkxMPkDxpdVNqftCL9WtSgM02
 dhMvqUPyGbNIig9m9EURjuqFNqCF7Un8AiPnCF2I6hn75H6OU9VKuAexgMetViFRvuhaADFH4Xa
 Sw+SBp5HVlKdEBF3EsCmXp/NVOeJWWcUQhjM8faOXDaO1W7cJ6+/fdYI+QF4XmmupRTSScB+elo
 36gVEQQhtJjtIrC9rg2LRIPDpkACi+tR9No0JQeL7xz3w8hxARwYrIu33npkQtVkiH1cplBk5GQ
 4zMIqM0B0UtM5KIy1TSd3hx3uxtGabIDhmoIR5tZO/9oxt+8VoRThGhXFgRPuVVLwO0wArWidr4
 F7iEBlWSUiz4rbASmcU7ZhbZ++WDrrrC0TQeVn4mJZzcc0Wl/3D/1ZfxFvPkTzeVX2LBCZSk8oM
 hR2cguQUY1nIlPQ==
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
 .../gadget/u_f.h => include/linux/usb/func_utils.h |   2 +-
 net/9p/Kconfig                                     |   6 +
 net/9p/Makefile                                    |   4 +
 net/9p/trans_usbg.c                                | 974 +++++++++++++++++++++
 tools/usb/p9_fwd.py                                | 243 +++++
 14 files changed, 1293 insertions(+), 10 deletions(-)
---
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
change-id: 20240116-ml-topic-u9p-895274530eb1

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


