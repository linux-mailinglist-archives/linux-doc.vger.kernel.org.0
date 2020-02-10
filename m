Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E3C1584DE
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2020 22:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgBJVji (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Feb 2020 16:39:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33798 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbgBJVji (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 16:39:38 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so9680089wrr.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2020 13:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6oIieVyHz+8Iv3bRfW5vGqMYr+WnaVMb6rPDak3UbxY=;
        b=d7whKnMCCgC1xFBwxZmL6F0xxOIGyrRCFLYhOEoREnBLU7uoHpCYzYTboa2Uhy8s2t
         vcev8KgIY6+eivICrYYl4nGfET7L91gWmVpjBDb5X4Y1dWfaG29TQb91RN3Nb2fOBr7B
         +gWny4pyvKWUbBMDxNoo6a0CYgVszrx+6wsuWJbm5y5TETt/B9AS/fp/E6h7RFaVBGSt
         fRgAP6BUAl4t+g0LA5oQg6nncb3euxsVNIaThWl1m091Jn0IL0hOiizrz0zQFw+HOsrb
         nTE87qSHXp9NxofEWv/o/zulNSd4lGsr76svT++uACAv5tEc2Z3Bw1lWx9IjcsaEhl7M
         +tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6oIieVyHz+8Iv3bRfW5vGqMYr+WnaVMb6rPDak3UbxY=;
        b=mefCunIF/lRWlufNUn6eMWrGlG01VbZxHZnm64g03u4fx0mP2ZZ42bL+C/gMIVEPs+
         jeSgvAObX6jwXkc0qm3i2KGwUKX37iD/jZqQqABJt94bEh4Gp2gC0HQ7HjbF6FUGXsyF
         miNBopah/kt5PRkWVanjpA6A8qzna/lg59IgVpMivM03Rig5CLJ/XUvXeb3gaIySZndW
         tJU91DBs4wKT14Fev2AQuRKrlhQ6xjBB8x68lreJ6cRPylE0LlZqbhCBxfTnU7EtLz4E
         dfNhWit8oGYGA1KwfD/No0++dJOa/O0VWCJ8CpUGxe4x1J8SgrVjQlMNr/F5ybNBD6C9
         xQ9A==
X-Gm-Message-State: APjAAAX1yjN10dXvqznbRCCwED+9VcNiObS0ALAvqoVNia4bynOUVC7G
        aNq+sMQxr/Ze0hXxrA8UAFTOKA==
X-Google-Smtp-Source: APXvYqylCnt1h+aWJLVaieqgIzlpcvLdu9GTYCquy+tOi7cFbH0Fr9NOOh0YLX6zEsU3ODpGHjU5aA==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr4053361wro.263.1581370773857;
        Mon, 10 Feb 2020 13:39:33 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id u14sm2118582wrm.51.2020.02.10.13.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 13:39:33 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v9 00/15] CoreSight CTI Driver
Date:   Mon, 10 Feb 2020 21:39:09 +0000
Message-Id: <20200210213924.20037-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CTIs are defined in the device tree and associated with other CoreSight
devices. The core CoreSight code has been modified to enable the registration
of the CTI devices on the same bus as the other CoreSight components,
but as these are not actually trace generation / capture devices, they
are not part of the Coresight path when generating trace.

However, the definition of the standard CoreSight device has been extended
to include a reference to an associated CTI device, and the enable / disable
trace path operations will auto enable/disable any associated CTI devices at
the same time.

Programming is at present via sysfs - a full API is provided to utilise the
hardware capabilities. As CTI devices are unprogrammed by default, the auto
enable describe above will have no effect until explicit programming takes
place.

A set of device tree bindings specific to the CTI topology has been defined.
The driver accesses these in a platform agnostic manner, so ACPI bindings
can be added later, once they have been agreed and defined for the CTI device.

Documentation has been updated to describe both the CTI hardware, its use and
programming in sysfs, and the new dts bindings required.

Tested on DB410 board and Juno board, against the Linux 5.6-rc1, 5.5 trees.

Changes since v8:
1) Use devm_ allocation in cti_match_fixup_csdev() to match other allocations.
2) Minor comment update per request.

Changes since v7:
NB: No functional driver changes in this set. Full set released for
consistency, completeness and ease of use.
1) Updates to device tree bindings .yaml following comments from Rob Herring.
   Adds #size-cells and #address-cells to properties and constrained as
   required. Validated using dt_binding_check.
2) Minor typo fixes to cti documentation file.

Changes since v6:
NB: No functional driver changes in this set. Full set released for
consistency, completeness and ease of use.
1) Updates to .yaml following comments from Maxime Ripard. Correct child node
   descriptions, fix validation, and ensure reg entries required in child
   nodes as per DeviceTree specification.
2) Update to Juno bindings to implement reg entry specification requirements.

Changes since v5:
1) Fixed up device tree .yaml file. Using extra compatible string for
v8 architecture CTI connections.
2) Ensure association code respects coresight mutex when setting cross
referenced pointers. Add in shutdown code.
3) Multiple minor code fixes & rationalisation. 

Changes since v4:
Multiple changes following feedback from Mathieu, Leo and Suzuki.
1) Dropped RFC tag - wider distribution
2) CTI bindings definition now presented as a .yaml file - tested with
with 'dt-doc-validate' from devicetree.org/dt-schema project and in kernel
build tree with 'make dtbs_check' per kernel docs.
3) Sysfs links to other CoreSight devices moved out of this set into
a following set that deals with all CoreSight devices & sysfs links.
4) Documentation in .rst format and new directory following patchset in [1].
Extended example provided in docs.
5) Rationalised devicetree of_ specifics to use generic fwnode functions
where possible to enable easier addition of ACPI support later.
6) Other minor changes as requested in feedback from last patchset.

Changes since v3:
1) After discussion on CS mailing list, each CTI connection has a triggers<N>
   sysfs directory with name and trigger signals listed for the connection.
2) Initial code for creating sysfs links between CoreSight components is
  introduced and implementation for CTI provided. This allows exploration
  of the CoreSight topology within the sysfs infrastructure. Patches for
  links between other CoreSight components to follow.
3) Power management - CPU hotplug and idle omitted from this set as ongoing
   developments may define required direction. Additional patch set to follow.
4) Multiple fixes applied as requested by reviewers esp. Matthieu, Suzuki
   and Leo. 

Changes since v2:
Updates to allow for new features on coresight/next and feedback from
Mathieu and Leo.

1) Rebase and restructuring to apply on top of ACPI support patch set,
currently on coresight/next. of_coresight_cti has been renamed to
coresight-cti-platform and device tree bindings added to this but accessed
in a platform agnostic manner using fwnode for later ACPI support
to be added.
2) Split the sysfs patch info a series of functional patches.
3) Revised the refcount and enabling support.
4) Adopted the generic naming protocol - CTIs are either cti_cpuN or
cti_sysM
5) Various minor presentation /checkpatch issues highlighted in feedback.
6) revised CPU hotplug to cover missing cases needed by ETM.

Changes since v1:
1) Significant restructuring of the source code. Adds cti-sysfs file and
cti device tree file. Patches add per feature rather than per source
file.
2) CPU type power event handling for hotplug moved to CoreSight core,
with generic registration interface provided for all CPU bound CS devices
to use.
3) CTI signal interconnection details in sysfs now generated dynamically
from connection lists in driver. This to fix issue with multi-line sysfs
output in previous version.
4) Full device tree bindings for DB410 and Juno provided (to the extent
that CTI information is available).
5) AMBA driver update for UCI IDs are now upstream so no longer included
in this set

Mike Leach (15):
  coresight: cti: Initial CoreSight CTI Driver
  coresight: cti: Add sysfs coresight mgmt reg access.
  coresight: cti: Add sysfs access to program function regs
  coresight: cti: Add sysfs trigger / channel programming API
  dt-bindings: arm: Adds CoreSight CTI hardware definitions.
  coresight: cti: Add device tree support for v8 arch CTI
  coresight: cti: Add device tree support for custom CTI.
  coresight: cti: Enable CTI associated with devices.
  coresight: cti: Add connection information to sysfs
  dt-bindings: qcom: Add CTI options for qcom msm8916
  dt-bindings: arm: Juno platform - add CTI entries to device tree.
  dt-bindings: hisilicon: Add CTI bindings for hi-6220
  docs: coresight: Update documentation for CoreSight to cover CTI.
  docs: sysfs: coresight: Add sysfs ABI documentation for CTI
  Update MAINTAINERS to add reviewer for CoreSight.

 .../testing/sysfs-bus-coresight-devices-cti   |  221 ++++
 .../bindings/arm/coresight-cti.yaml           |  336 +++++
 .../devicetree/bindings/arm/coresight.txt     |    7 +
 .../trace/coresight/coresight-ect.rst         |  211 +++
 Documentation/trace/coresight/coresight.rst   |   13 +
 MAINTAINERS                                   |    3 +
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  162 ++-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi     |   37 +-
 arch/arm64/boot/dts/arm/juno-r1.dts           |   25 +
 arch/arm64/boot/dts/arm/juno-r2.dts           |   25 +
 arch/arm64/boot/dts/arm/juno.dts              |   25 +
 .../boot/dts/hisilicon/hi6220-coresight.dtsi  |  130 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   85 +-
 drivers/hwtracing/coresight/Kconfig           |   21 +
 drivers/hwtracing/coresight/Makefile          |    3 +
 .../coresight/coresight-cti-platform.c        |  485 +++++++
 .../hwtracing/coresight/coresight-cti-sysfs.c | 1175 +++++++++++++++++
 drivers/hwtracing/coresight/coresight-cti.c   |  748 +++++++++++
 drivers/hwtracing/coresight/coresight-cti.h   |  235 ++++
 .../hwtracing/coresight/coresight-platform.c  |   20 +
 drivers/hwtracing/coresight/coresight-priv.h  |   15 +
 drivers/hwtracing/coresight/coresight.c       |   86 +-
 include/dt-bindings/arm/coresight-cti-dt.h    |   37 +
 include/linux/coresight.h                     |   27 +
 24 files changed, 4101 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
 create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
 create mode 100644 Documentation/trace/coresight/coresight-ect.rst
 create mode 100644 drivers/hwtracing/coresight/coresight-cti-platform.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti-sysfs.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti.c
 create mode 100644 drivers/hwtracing/coresight/coresight-cti.h
 create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h

-- 
2.17.1

