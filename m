Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9F3FE16B
	for <lists+linux-doc@lfdr.de>; Fri, 15 Nov 2019 16:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfKOPft (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Nov 2019 10:35:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23097 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727680AbfKOPfs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 10:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573832146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OixvqTV1IxVuShrXtiRs+/ZEbuvrAgG5Cpf1NhQlRk4=;
        b=CzluX0beDjZi+3R6FzMlO+NIqva73zZq2iLgEe/Sdl07xSdT3PSgdj/c5uaNZYWrCPla3Z
        7xqeo26TQJWQnMO9myQ7UwrIH857l0c42+7NfL9Pm22q8GCrB2ybWzSEYYkZrJqQhVacFR
        /C/evH3RgNKkocFQhe72l3bVJSlB88k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-ngfll0vkOZuPv2WP52TSKg-1; Fri, 15 Nov 2019 10:35:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D7810D237A;
        Fri, 15 Nov 2019 15:35:39 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-154.ams2.redhat.com [10.36.116.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4BA6117E;
        Fri, 15 Nov 2019 15:35:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v8 1/8] efi: Export boot-services code and data as debugfs-blobs
Date:   Fri, 15 Nov 2019 16:35:22 +0100
Message-Id: <20191115153529.215244-2-hdegoede@redhat.com>
In-Reply-To: <20191115153529.215244-1-hdegoede@redhat.com>
References: <20191115153529.215244-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ngfll0vkOZuPv2WP52TSKg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sometimes it is useful to be able to dump the efi boot-services code and
data. This commit adds these as debugfs-blobs to /sys/kernel/debug/efi,
but only if efi=3Ddebug is passed on the kernel-commandline as this require=
s
not freeing those memory-regions, which costs 20+ MB of RAM.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
-Add pr_warn if there are mode then EFI_DEBUGFS_MAX_BLOBS boot service segm=
ents
-Document how the boot_service_code? files can be used to check for embedde=
d
 firmware. Note since this is related to the firmware EFI embedded fw suppo=
rt,
 these docs are added in the 4th patch of this patch-set, not in this one.

Changes in v5:
-Rename the EFI_BOOT_SERVICES flag to EFI_PRESERVE_BS_REGIONS

Changes in v4:
-Add new EFI_BOOT_SERVICES flag and use it to determine if the boot-service=
s
 memory segments are available (and thus if it makes sense to register the
 debugfs bits for them)

Changes in v2:
-Do not call pr_err on debugfs call failures
---
 arch/x86/platform/efi/efi.c    |  1 +
 arch/x86/platform/efi/quirks.c |  4 +++
 drivers/firmware/efi/efi.c     | 57 ++++++++++++++++++++++++++++++++++
 include/linux/efi.h            |  1 +
 4 files changed, 63 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 425e025341db..f8a9f5230aaf 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -232,6 +232,7 @@ int __init efi_memblock_x86_reserve_range(void)
 =09     efi.memmap.desc_version);
=20
 =09memblock_reserve(pmap, efi.memmap.nr_map * efi.memmap.desc_size);
+=09set_bit(EFI_PRESERVE_BS_REGIONS, &efi.flags);
=20
 =09return 0;
 }
diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.=
c
index 3b9fd679cea9..fab12ebf0ada 100644
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -411,6 +411,10 @@ void __init efi_free_boot_services(void)
 =09int num_entries =3D 0;
 =09void *new, *new_md;
=20
+=09/* Keep all regions for /sys/kernel/debug/efi */
+=09if (efi_enabled(EFI_DBG))
+=09=09return;
+
 =09for_each_efi_memory_desc(md) {
 =09=09unsigned long long start =3D md->phys_addr;
 =09=09unsigned long long size =3D md->num_pages << EFI_PAGE_SHIFT;
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index e98bbf8e56d9..bee809b337de 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -17,6 +17,7 @@
 #include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/efi.h>
 #include <linux/of.h>
@@ -317,6 +318,59 @@ static __init int efivar_ssdt_load(void)
 static inline int efivar_ssdt_load(void) { return 0; }
 #endif
=20
+#ifdef CONFIG_DEBUG_FS
+
+#define EFI_DEBUGFS_MAX_BLOBS 32
+
+static struct debugfs_blob_wrapper debugfs_blob[EFI_DEBUGFS_MAX_BLOBS];
+
+static void __init efi_debugfs_init(void)
+{
+=09struct dentry *efi_debugfs;
+=09efi_memory_desc_t *md;
+=09char name[32];
+=09int type_count[EFI_BOOT_SERVICES_DATA + 1] =3D {};
+=09int i =3D 0;
+
+=09efi_debugfs =3D debugfs_create_dir("efi", NULL);
+=09if (IS_ERR_OR_NULL(efi_debugfs))
+=09=09return;
+
+=09for_each_efi_memory_desc(md) {
+=09=09switch (md->type) {
+=09=09case EFI_BOOT_SERVICES_CODE:
+=09=09=09snprintf(name, sizeof(name), "boot_services_code%d",
+=09=09=09=09 type_count[md->type]++);
+=09=09=09break;
+=09=09case EFI_BOOT_SERVICES_DATA:
+=09=09=09snprintf(name, sizeof(name), "boot_services_data%d",
+=09=09=09=09 type_count[md->type]++);
+=09=09=09break;
+=09=09default:
+=09=09=09continue;
+=09=09}
+
+=09=09if (i >=3D EFI_DEBUGFS_MAX_BLOBS) {
+=09=09=09pr_warn("More then %d EFI boot service segments, only showing fir=
st %d in debugfs\n",
+=09=09=09=09EFI_DEBUGFS_MAX_BLOBS, EFI_DEBUGFS_MAX_BLOBS);
+=09=09=09break;
+=09=09}
+
+=09=09debugfs_blob[i].size =3D md->num_pages << EFI_PAGE_SHIFT;
+=09=09debugfs_blob[i].data =3D memremap(md->phys_addr,
+=09=09=09=09=09=09debugfs_blob[i].size,
+=09=09=09=09=09=09MEMREMAP_WB);
+=09=09if (!debugfs_blob[i].data)
+=09=09=09continue;
+
+=09=09debugfs_create_blob(name, 0400, efi_debugfs, &debugfs_blob[i]);
+=09=09i++;
+=09}
+}
+#else
+static inline void efi_debugfs_init(void) {}
+#endif
+
 /*
  * We register the efi subsystem with the firmware subsystem and the
  * efivars subsystem with the efi subsystem, if the system was booted with
@@ -373,6 +427,9 @@ static int __init efisubsys_init(void)
 =09=09goto err_remove_group;
 =09}
=20
+=09if (efi_enabled(EFI_DBG) && efi_enabled(EFI_PRESERVE_BS_REGIONS))
+=09=09efi_debugfs_init();
+
 =09return 0;
=20
 err_remove_group:
diff --git a/include/linux/efi.h b/include/linux/efi.h
index d87acf62958e..2929abb1e3c0 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1202,6 +1202,7 @@ extern int __init efi_setup_pcdp_console(char *);
 #define EFI_DBG=09=09=098=09/* Print additional debug info at runtime */
 #define EFI_NX_PE_DATA=09=099=09/* Can runtime data regions be mapped non-=
executable? */
 #define EFI_MEM_ATTR=09=0910=09/* Did firmware publish an EFI_MEMORY_ATTRI=
BUTES table? */
+#define EFI_PRESERVE_BS_REGIONS=0911=09/* Are EFI boot-services memory seg=
ments available? */
=20
 #ifdef CONFIG_EFI
 /*
--=20
2.23.0

