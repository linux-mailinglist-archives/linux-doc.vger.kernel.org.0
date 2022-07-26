Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32C458198D
	for <lists+linux-doc@lfdr.de>; Tue, 26 Jul 2022 20:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiGZSRp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Jul 2022 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiGZSRp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 14:17:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5A831209;
        Tue, 26 Jul 2022 11:17:41 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ss3so27521499ejc.11;
        Tue, 26 Jul 2022 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc;
        bh=h00PGtI5Q+Vq+rwI7a7mCGY+zP44CX8kKPKIN4rFPEM=;
        b=Z4NjO3L+UkHLRTUWqPdSG16XaK0YzEw/sCOYfHKfUN+1ttR0A4NT6iNb537H+HrOCl
         n177sVcVbLGLiLudq1wkK6WqbDvTT9rxR7pHWhaYsYB9OGp8qzJVj6MIOYnPllpmw2Dc
         5ty0jPoKa1H0o1Gw0TDhXpb0vrqr5TDlQMLpxHCcgc2Y6xhgnIt8ROutkqEArNdI5MEd
         VMnJYOm160eAZ7rPEV/47Q23e5twkmFmk92mpeqnNT0EE7Vi2cgIJFVvRWWKt5Vd8aji
         OSw7AUHjt8Mo8Xt4I5nAXs4RiVDeRvPIvMXza54ooAAoRd56773Se3wRrBQncchswsCu
         hz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc;
        bh=h00PGtI5Q+Vq+rwI7a7mCGY+zP44CX8kKPKIN4rFPEM=;
        b=dpZpJ+TIYXV1ymH7miAMJfmlvM3SY3wVnoaJUBOM/zZuW+FgatDUOrfEVZyj+AOcnM
         yepGgQc3j+1bGgOYasLTMlChdvwG3XfieLv9z6ca+qhX8rhZxhyPIDvz9k0hbmic+0U4
         dcZSzwoxj/bTWW+RiE7Kat9HwNPpn5gtjlr2Cvnkg8zKdveJjGotwyiUJ+WgwC//wWFY
         XjVRwhtYii7eYQZZfVyvbOsZ0nr9fwDR1W/4Mkd+uTFmpItiFONxpZPjTNCOYrFa2iK4
         ZloqgZ5vlIOX1PpSNoW16GNYo/Xf3ttjO8hPiA6BF/n5zPDSGX8aRIoEwktqSKuN3C/L
         v0dA==
X-Gm-Message-State: AJIora9DoPAjPzIkdGcBAiSlvKnnPU8eK6b/sUejdNHXNrMFh+74XS9o
        4jmTh0MctpIm0k2gtoO4Wkk=
X-Google-Smtp-Source: AGRyM1sbsB5yzGb7yS4H8IKFfg8k7CTjB8EsIo76JwlE5bIrUXv/w4PO6XSuqP0DKn6koohfN1GvwA==
X-Received: by 2002:a17:906:4598:b0:72f:643c:db45 with SMTP id qs24-20020a170906459800b0072f643cdb45mr14995160ejc.194.1658859459559;
        Tue, 26 Jul 2022 11:17:39 -0700 (PDT)
Received: from cizrna.home (cst-prg-32-113.cust.vodafone.cz. [46.135.32.113])
        by smtp.gmail.com with ESMTPSA id kz20-20020a17090777d400b00722e203633esm6741406ejc.122.2022.07.26.11.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 11:17:38 -0700 (PDT)
Sender: Tomeu Vizoso <tomeu.vizoso@gmail.com>
From:   Tomeu Vizoso <tomeu.vizoso@collabora.com>
To:     David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5] drm: Add initial ci/ subdirectory
Date:   Tue, 26 Jul 2022 20:16:36 +0200
Message-Id: <20220726181636.19967-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220517081656.47625-1-tomeu.vizoso@collabora.com>
References: <20220517081656.47625-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

And use it to store expectations about what the DRM drivers are
supposed to pass in the IGT test suite.

Also include a configuration file that points to the out-of-tree CI
scripts.

By storing the test expectations along the code we can make sure both
stay in sync with each other, and so we can know when a code change
breaks those expectations.

This will allow all contributors to drm to reuse the infrastructure
already in gitlab.freedesktop.org to test the driver on several
generations of the hardware.

v2:
  - Fix names of result expectation files to match SoC
  - Don't execute tests that are going to skip on all boards

v3:
  - Remove tracking of dmesg output during test execution

v4:
  - Move up to drivers/gpu/drm
  - Add support for a bunch of other drivers
  - Explain how to incorporate fixes for CI from a
    ${TARGET_BRANCH}-external-fixes branch
  - Remove tests that pass from expected results file, to reduce the
    size of in-tree files
  - Add docs about how to deal with outages in automated testing labs
  - Specify the exact SHA of the CI scripts to be used

v5:
  - Remove unneeded skips from Meson expectations file
  - Use a more advanced runner that detects flakes automatically
  - Use a more succint format for the expectations
  - Run many more tests (and use sharding to finish in time)
  - Use skip lists to avoid hanging machines
  - Add some build testing
  - Build IGT in each pipeline for faster uprevs
  - List failures in the GitLab UI

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/gpu/automated_testing.rst       | 84 ++++++++++++++++++
 drivers/gpu/drm/ci/amdgpu-stoney-fails.txt    | 13 +++
 drivers/gpu/drm/ci/amdgpu-stoney-flakes.txt   | 20 +++++
 drivers/gpu/drm/ci/amdgpu-stoney-skips.txt    |  2 +
 drivers/gpu/drm/ci/gitlab-ci.yml              | 13 +++
 drivers/gpu/drm/ci/i915-amly-flakes.txt       | 32 +++++++
 drivers/gpu/drm/ci/i915-amly-skips.txt        |  2 +
 drivers/gpu/drm/ci/i915-apl-fails.txt         | 29 +++++++
 drivers/gpu/drm/ci/i915-apl-flakes.txt        |  1 +
 drivers/gpu/drm/ci/i915-apl-skips.txt         |  2 +
 drivers/gpu/drm/ci/i915-cml-flakes.txt        | 36 ++++++++
 drivers/gpu/drm/ci/i915-glk-flakes.txt        | 40 +++++++++
 drivers/gpu/drm/ci/i915-glk-skips.txt         |  2 +
 drivers/gpu/drm/ci/i915-kbl-fails.txt         |  8 ++
 drivers/gpu/drm/ci/i915-kbl-flakes.txt        | 24 ++++++
 drivers/gpu/drm/ci/i915-kbl-skips.txt         |  2 +
 drivers/gpu/drm/ci/i915-tgl-fails.txt         | 19 ++++
 drivers/gpu/drm/ci/i915-tgl-flakes.txt        |  6 ++
 drivers/gpu/drm/ci/i915-tgl-skips.txt         |  8 ++
 drivers/gpu/drm/ci/i915-whl-fails.txt         | 30 +++++++
 drivers/gpu/drm/ci/i915-whl-flakes.txt        |  1 +
 drivers/gpu/drm/ci/mediatek-mt8173-fails.txt  | 29 +++++++
 drivers/gpu/drm/ci/mediatek-mt8183-fails.txt  | 10 +++
 drivers/gpu/drm/ci/mediatek-mt8183-flakes.txt | 14 +++
 drivers/gpu/drm/ci/meson-g12b-fails.txt       |  5 ++
 drivers/gpu/drm/ci/meson-g12b-flakes.txt      |  4 +
 drivers/gpu/drm/ci/msm-apq8016-fails.txt      | 15 ++++
 drivers/gpu/drm/ci/msm-apq8016-flakes.txt     |  4 +
 drivers/gpu/drm/ci/msm-apq8096-fails.txt      |  2 +
 drivers/gpu/drm/ci/msm-apq8096-flakes.txt     |  4 +
 drivers/gpu/drm/ci/msm-apq8096-skips.txt      |  2 +
 drivers/gpu/drm/ci/msm-sc7180-fails.txt       | 22 +++++
 drivers/gpu/drm/ci/msm-sc7180-flakes.txt      | 14 +++
 drivers/gpu/drm/ci/msm-sc7180-skips.txt       | 18 ++++
 drivers/gpu/drm/ci/msm-sdm845-fails.txt       | 44 ++++++++++
 drivers/gpu/drm/ci/msm-sdm845-flakes.txt      | 33 +++++++
 drivers/gpu/drm/ci/msm-sdm845-skips.txt       |  2 +
 drivers/gpu/drm/ci/rockchip-rk3288-fails.txt  | 75 ++++++++++++++++
 drivers/gpu/drm/ci/rockchip-rk3288-flakes.txt |  5 ++
 drivers/gpu/drm/ci/rockchip-rk3288-skips.txt  | 46 ++++++++++
 drivers/gpu/drm/ci/rockchip-rk3399-fails.txt  | 86 +++++++++++++++++++
 drivers/gpu/drm/ci/rockchip-rk3399-flakes.txt | 25 ++++++
 drivers/gpu/drm/ci/rockchip-rk3399-skips.txt  |  5 ++
 drivers/gpu/drm/ci/virtio_gpu-none-fails.txt  | 38 ++++++++
 drivers/gpu/drm/ci/virtio_gpu-none-flakes.txt |  0
 drivers/gpu/drm/ci/virtio_gpu-none-skips.txt  |  6 ++
 46 files changed, 882 insertions(+)
 create mode 100644 Documentation/gpu/automated_testing.rst
 create mode 100644 drivers/gpu/drm/ci/amdgpu-stoney-fails.txt
 create mode 100644 drivers/gpu/drm/ci/amdgpu-stoney-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/amdgpu-stoney-skips.txt
 create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
 create mode 100644 drivers/gpu/drm/ci/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-amly-skips.txt
 create mode 100644 drivers/gpu/drm/ci/i915-apl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-apl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-glk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-glk-skips.txt
 create mode 100644 drivers/gpu/drm/ci/i915-kbl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/i915-kbl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-kbl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/i915-tgl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/i915-tgl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/i915-whl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/i915-whl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek-mt8173-fails.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/meson-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/meson-g12b-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/msm-apq8016-fails.txt
 create mode 100644 drivers/gpu/drm/ci/msm-apq8016-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/msm-apq8096-fails.txt
 create mode 100644 drivers/gpu/drm/ci/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/msm-apq8096-skips.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sc7180-fails.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sc7180-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sc7180-skips.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sdm845-fails.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sdm845-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/msm-sdm845-skips.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3288-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/virtio_gpu-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/virtio_gpu-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/virtio_gpu-none-skips.txt

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
new file mode 100644
index 000000000000..61003ecc7b6e
--- /dev/null
+++ b/Documentation/gpu/automated_testing.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================================
+Automated testing of the DRM subsystem
+=========================================
+
+
+Introduction
+============
+
+Making sure that changes to the core or drivers don't introduce regressions can be very time consuming when lots of different hardware configurations need to be tested. Moreover, it isn't practical for each person interested in this testing to have to acquire and maintain what can be a considerable amount of hardware.
+
+Also, it is desirable for developers to check for regressions in their code by themselves, instead of relying on the maintainers finding them and then reporting back.
+
+There are facilities in gitlab.freedesktop.org to automatically test Mesa that can be used as well for testing the DRM subsystem. This document explains how people interested in testing it can use this shared infrastructure to save quite some time and effort.
+
+
+Relevant files
+==============
+
+drivers/gpu/drm/ci/gitlab-ci.yml
+--------------------------------
+
+Specifies the specific version of the scripts to be used. GitLab CI will use the values defined in this file to fetch the right scripts.
+
+
+drivers/gpu/drm/ci/${DRIVER_NAME}.testlist
+------------------------------------------
+
+Specifies the tests that the current code is expected to be able to reliably run for ${DRIVER_NAME}. These tests are expected to not hang the DUT (Device Under Testing) when running on the revision they belong to, and to give consistent results.
+
+
+drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt
+----------------------------------------
+
+Specifies the expected results of running this specific kernel revision on a given hardware configuration.
+
+
+How to enable automated testing on your tree
+============================================
+
+1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one yet
+
+2. In your kernel repo's configuration (eg. https://gitlab.freedesktop.org/tomeu/linux/-/settings/ci_cd), change the CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/ci/gitlab-ci.yml.
+
+3. Next time you push to this repository, you will see a CI pipeline being created (eg. https://gitlab.freedesktop.org/tomeu/linux/-/pipelines)
+
+4. The various jobs will be run and when the pipeline is finished, all jobs should be green unless a regression has been found.
+
+
+How to update test expectations
+===============================
+
+If your changes to the code fix any tests, you will have to update one or more of the files in drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt, for each of the test platforms affected by the change.
+
+If you have run a pipeline and it failed because of a mismatched test result, you will have been offered a patch at the end of the run that you can apply after reviewing it.
+
+
+How to expand coverage
+======================
+
+If your code changes makes it possible to run more tests (by solving reliability issues, for example), more tests can be added to this list, and then the expected results updated with the patch file that will be printed at the end of each job.
+
+If there is a need for updating the version of IGT being used (maybe you have added more tests to it), follow the instructions at https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/tree/main#upreving-igt.
+
+
+How to test your changes to the scripts
+==========================================
+
+For testing changes to the scripts in the drm-ci repo, change the DRM_CI_PROJECT_PATH variable in drivers/gpu/drm/ci/gitlab-ci.yml to match your fork of the project (eg. tomeu/drm-ci). This fork needs to be in https://gitlab.freedesktop.org/.
+
+
+How to incorporate external fixes in your testing
+=================================================
+
+Often, regressions in other trees will prevent testing changes local to the tree under test. These fixes will be automatically merged in during the build jobs from a branch in the target tree that is named as ${TARGET_BRANCH}-external-fixes.
+
+If the pipeline is not in a merge request and a branch with the same name exists in the local tree, commits from that branch will be merged in as well.
+
+
+How to deal with automated testing labs that may be down
+========================================================
+
+If a hardware farm is down and thus causing pipelines to fail that would otherwise pass, one can disable all jobs that would be submitted to that farm by editing the file at https://gitlab.freedesktop.org/gfx-ci/lab-status/-/blob/main/lab-status.yml.
diff --git a/drivers/gpu/drm/ci/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/amdgpu-stoney-fails.txt
new file mode 100644
index 000000000000..e721568b6ec3
--- /dev/null
+++ b/drivers/gpu/drm/ci/amdgpu-stoney-fails.txt
@@ -0,0 +1,13 @@
+kms_addfb_basic@bad-pitch-65536,Fail
+kms_addfb_basic@bo-too-small,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_cursor_crc@pipe-A-cursor-size-change,Fail
+kms_cursor_crc@pipe-B-cursor-size-change,Fail
+kms_hdr@bpc-switch,Fail
+kms_hdr@bpc-switch-dpms,Fail
+kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
+kms_rotation_crc@primary-rotation-180,Fail
+kms_universal_plane@disable-primary-vs-flip-pipe-B,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/amdgpu-stoney-flakes.txt
new file mode 100644
index 000000000000..a2cbc339838c
--- /dev/null
+++ b/drivers/gpu/drm/ci/amdgpu-stoney-flakes.txt
@@ -0,0 +1,20 @@
+kms_addfb_basic@too-high
+kms_atomic_transition@plane-all-modeset-transition-internal-panels
+kms_atomic_transition@plane-all-transition
+kms_atomic_transition@plane-use-after-nonblocking-unbind
+kms_bw@linear-tiling-1-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-3840x2160p
+kms_cursor_edge_walk@pipe-A-64x64-bottom-edge
+kms_cursor_edge_walk@pipe-A-64x64-right-edge
+kms_cursor_edge_walk@pipe-A-64x64-top-edge
+kms_cursor_edge_walk@pipe-B-64x64-bottom-edge
+kms_cursor_edge_walk@pipe-B-64x64-left-edge
+kms_cursor_edge_walk@pipe-B-64x64-right-edge
+kms_cursor_edge_walk@pipe-B-64x64-top-edge
+kms_plane_multiple@atomic-pipe-B-tiling-none
+kms_plane@pixel-format
+kms_plane_scaling@downscale-with-rotation-factor-0-5
+kms_universal_plane@disable-primary-vs-flip-pipe-A
diff --git a/drivers/gpu/drm/ci/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/amdgpu-stoney-skips.txt
new file mode 100644
index 000000000000..e2c538a0f954
--- /dev/null
+++ b/drivers/gpu/drm/ci/amdgpu-stoney-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
new file mode 100644
index 000000000000..8898bbe0f180
--- /dev/null
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -0,0 +1,13 @@
+variables:
+  # Change this to use your fork of drm-ci
+  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha bccff240ca042820484096f0782e8f060bd83bca
+
+  UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
+  TARGET_BRANCH: drm-next
+
+include:
+  - project: *drm-ci-project-path
+    ref: *drm-ci-commit-sha
+    file:
+      - '.gitlab-ci.yml'
diff --git a/drivers/gpu/drm/ci/i915-amly-flakes.txt b/drivers/gpu/drm/ci/i915-amly-flakes.txt
new file mode 100644
index 000000000000..67d78f10b671
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-amly-flakes.txt
@@ -0,0 +1,32 @@
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-2560x1440p
+kms_bw@linear-tiling-2-displays-3840x2160p
+kms_bw@linear-tiling-3-displays-1920x1080p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-3840x2160p
+kms_bw@linear-tiling-4-displays-1920x1080p
+kms_bw@linear-tiling-4-displays-2560x1440p
+kms_bw@linear-tiling-4-displays-3840x2160p
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
+kms_plane_alpha_blend@pipe-A-alpha-basic
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-A-constant-alpha-max
+kms_plane_alpha_blend@pipe-B-alpha-basic
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-B-constant-alpha-max
+kms_plane_alpha_blend@pipe-C-alpha-basic
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-C-constant-alpha-max
+kms_sysfs_edid_timing
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-amly-skips.txt b/drivers/gpu/drm/ci/i915-amly-skips.txt
new file mode 100644
index 000000000000..e2c538a0f954
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-amly-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-apl-fails.txt b/drivers/gpu/drm/ci/i915-apl-fails.txt
new file mode 100644
index 000000000000..a077f29d5cba
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-apl-fails.txt
@@ -0,0 +1,29 @@
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_bw@linear-tiling-4-displays-1920x1080p,Fail
+kms_bw@linear-tiling-4-displays-2560x1440p,Fail
+kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_sysfs_edid_timing,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-apl-flakes.txt b/drivers/gpu/drm/ci/i915-apl-flakes.txt
new file mode 100644
index 000000000000..618bbe6bb793
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-apl-flakes.txt
@@ -0,0 +1 @@
+kms_frontbuffer_tracking@fbc-tiling-linear
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-apl-skips.txt b/drivers/gpu/drm/ci/i915-apl-skips.txt
new file mode 100644
index 000000000000..e2c538a0f954
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-apl-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-cml-flakes.txt b/drivers/gpu/drm/ci/i915-cml-flakes.txt
new file mode 100644
index 000000000000..a214419c6dc5
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-cml-flakes.txt
@@ -0,0 +1,36 @@
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-2560x1440p
+kms_bw@linear-tiling-2-displays-3840x2160p
+kms_bw@linear-tiling-3-displays-1920x1080p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-3840x2160p
+kms_bw@linear-tiling-4-displays-1920x1080p
+kms_bw@linear-tiling-4-displays-2560x1440p
+kms_bw@linear-tiling-4-displays-3840x2160p
+kms_flip@flip-vs-suspend
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
+kms_hdr@bpc-switch-suspend
+kms_plane_alpha_blend@pipe-A-alpha-basic
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-A-constant-alpha-max
+kms_plane_alpha_blend@pipe-B-alpha-basic
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-B-constant-alpha-max
+kms_plane_alpha_blend@pipe-C-alpha-basic
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-C-constant-alpha-max
+kms_psr2_su@page_flip-NV12
+kms_psr2_su@page_flip-P010
+kms_setmode@basic
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-glk-flakes.txt b/drivers/gpu/drm/ci/i915-glk-flakes.txt
new file mode 100644
index 000000000000..aedb3d2ef885
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-glk-flakes.txt
@@ -0,0 +1,40 @@
+kms_bw@linear-tiling-1-displays-3840x2160p
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-2560x1440p
+kms_bw@linear-tiling-2-displays-3840x2160p
+kms_bw@linear-tiling-3-displays-1920x1080p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-3840x2160p
+kms_bw@linear-tiling-4-displays-1920x1080p
+kms_bw@linear-tiling-4-displays-2560x1440p
+kms_bw@linear-tiling-4-displays-3840x2160p
+kms_flip@blocking-wf_vblank
+kms_flip@wf_vblank-ts-check
+kms_flip@wf_vblank-ts-check-interruptible
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
+kms_frontbuffer_tracking@fbc-tiling-linear
+kms_plane_alpha_blend@pipe-A-alpha-basic
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-A-constant-alpha-max
+kms_plane_alpha_blend@pipe-B-alpha-basic
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-B-constant-alpha-max
+kms_plane_alpha_blend@pipe-C-alpha-basic
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-C-constant-alpha-max
+kms_rotation_crc@multiplane-rotation
+kms_rotation_crc@multiplane-rotation-cropping-bottom
+kms_rotation_crc@multiplane-rotation-cropping-top
+kms_setmode@basic
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-glk-skips.txt b/drivers/gpu/drm/ci/i915-glk-skips.txt
new file mode 100644
index 000000000000..e2c538a0f954
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-glk-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-kbl-fails.txt b/drivers/gpu/drm/ci/i915-kbl-fails.txt
new file mode 100644
index 000000000000..f81f065e27e8
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-kbl-fails.txt
@@ -0,0 +1,8 @@
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-4-displays-2560x1440p,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/i915-kbl-flakes.txt
new file mode 100644
index 000000000000..f82017654cf5
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-kbl-flakes.txt
@@ -0,0 +1,24 @@
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-2-displays-3840x2160p
+kms_bw@linear-tiling-3-displays-1920x1080p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_bw@linear-tiling-3-displays-3840x2160p
+kms_bw@linear-tiling-4-displays-1920x1080p
+kms_bw@linear-tiling-4-displays-3840x2160p
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+kms_plane_alpha_blend@pipe-A-alpha-basic
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-B-alpha-basic
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
+kms_plane_alpha_blend@pipe-B-constant-alpha-max
+kms_plane_alpha_blend@pipe-C-alpha-basic
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
+kms_sysfs_edid_timing
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-kbl-skips.txt b/drivers/gpu/drm/ci/i915-kbl-skips.txt
new file mode 100644
index 000000000000..e2c538a0f954
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-kbl-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-tgl-fails.txt b/drivers/gpu/drm/ci/i915-tgl-fails.txt
new file mode 100644
index 000000000000..270644ce220c
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-tgl-fails.txt
@@ -0,0 +1,19 @@
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_bw@linear-tiling-4-displays-1920x1080p,Fail
+kms_bw@linear-tiling-4-displays-2560x1440p,Fail
+kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+kms_bw@linear-tiling-5-displays-1920x1080p,Fail
+kms_bw@linear-tiling-5-displays-2560x1440p,Fail
+kms_bw@linear-tiling-5-displays-3840x2160p,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_rotation_crc@bad-pixel-format,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/i915-tgl-flakes.txt
new file mode 100644
index 000000000000..15fba77ff19d
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-tgl-flakes.txt
@@ -0,0 +1,6 @@
+kms_draw_crc@draw-method-rgb565-blt-untiled
+kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled
+kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled
+kms_flip@blocking-absolute-wf_vblank
+kms_flip@bo-too-big-interruptible
+kms_flip@flip-vs-rmfb-interruptible
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-tgl-skips.txt b/drivers/gpu/drm/ci/i915-tgl-skips.txt
new file mode 100644
index 000000000000..14f33c7ba03b
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-tgl-skips.txt
@@ -0,0 +1,8 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# GPU hangs, then the whole machine
+gem_eio.*
+
+# Whole machine hangs
+kms_flip@absolute-wf_vblank@a-edp1
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-whl-fails.txt b/drivers/gpu/drm/ci/i915-whl-fails.txt
new file mode 100644
index 000000000000..dbfedfa5d63f
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-whl-fails.txt
@@ -0,0 +1,30 @@
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_bw@linear-tiling-4-displays-1920x1080p,Fail
+kms_bw@linear-tiling-4-displays-2560x1440p,Fail
+kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
+kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_sysfs_edid_timing,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/i915-whl-flakes.txt b/drivers/gpu/drm/ci/i915-whl-flakes.txt
new file mode 100644
index 000000000000..6bcac5b84fbb
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915-whl-flakes.txt
@@ -0,0 +1 @@
+kms_flip@flip-vs-suspend
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/mediatek-mt8173-fails.txt
new file mode 100644
index 000000000000..7f74fb9afc99
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek-mt8173-fails.txt
@@ -0,0 +1,29 @@
+kms_3d,Fail
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
+kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
+kms_force_connector_basic@force-connector-state,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_force_connector_basic@force-load-detect,Fail
+kms_force_connector_basic@prune-stale-modes,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_plane_scaling@planes-upscale-20x20,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
+kms_plane_scaling@upscale-with-modifier-20x20,Fail
+kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
+kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_properties@plane-properties-legacy,Fail
+kms_rmfb@close-fd,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/mediatek-mt8183-fails.txt
new file mode 100644
index 000000000000..6ff81d00e84e
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek-mt8183-fails.txt
@@ -0,0 +1,10 @@
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
+kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_rmfb@close-fd,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..208890b79eb0
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek-mt8183-flakes.txt
@@ -0,0 +1,14 @@
+core_setmaster_vs_auth
+kms_bw@linear-tiling-1-displays-1920x1080p
+kms_bw@linear-tiling-1-displays-3840x2160p
+kms_bw@linear-tiling-3-displays-1920x1080p
+kms_cursor_legacy@cursor-vs-flip-atomic
+kms_plane_scaling@invalid-num-scalers
+kms_plane_scaling@planes-upscale-20x20
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
+kms_plane_scaling@upscale-with-modifier-20x20
+kms_plane_scaling@upscale-with-pixel-format-20x20
+kms_prop_blob@invalid-set-prop-any
+kms_properties@get_properties-sanity-atomic
+kms_properties@plane-properties-atomic
+kms_properties@plane-properties-legacy
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/meson-g12b-fails.txt b/drivers/gpu/drm/ci/meson-g12b-fails.txt
new file mode 100644
index 000000000000..345e1426b3a3
--- /dev/null
+++ b/drivers/gpu/drm/ci/meson-g12b-fails.txt
@@ -0,0 +1,5 @@
+kms_3d,Fail
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/meson-g12b-flakes.txt b/drivers/gpu/drm/ci/meson-g12b-flakes.txt
new file mode 100644
index 000000000000..b63329d06767
--- /dev/null
+++ b/drivers/gpu/drm/ci/meson-g12b-flakes.txt
@@ -0,0 +1,4 @@
+kms_force_connector_basic@force-connector-state
+kms_force_connector_basic@force-edid
+kms_force_connector_basic@force-load-detect
+kms_force_connector_basic@prune-stale-modes
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/msm-apq8016-fails.txt
new file mode 100644
index 000000000000..16c2dfab3f16
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-apq8016-fails.txt
@@ -0,0 +1,15 @@
+kms_3d,Fail
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_cursor_legacy@all-pipes-forked-move,Fail
+kms_cursor_legacy@all-pipes-torture-bo,Fail
+kms_cursor_legacy@all-pipes-forked-bo,Fail
+kms_cursor_legacy@all-pipes-single-bo,Fail
+kms_cursor_legacy@all-pipes-single-move,Fail
+kms_cursor_legacy@all-pipes-torture-move,Fail
+kms_cursor_legacy@pipe-A-forked-bo,Fail
+kms_cursor_legacy@pipe-A-forked-move,Fail
+kms_cursor_legacy@pipe-A-single-bo,Fail
+kms_cursor_legacy@pipe-A-single-move,Fail
+kms_cursor_legacy@pipe-A-torture-bo,Fail
+kms_cursor_legacy@pipe-A-torture-move,Fail
+kms_hdmi_inject@inject-4k,Fail
diff --git a/drivers/gpu/drm/ci/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/msm-apq8016-flakes.txt
new file mode 100644
index 000000000000..b63329d06767
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-apq8016-flakes.txt
@@ -0,0 +1,4 @@
+kms_force_connector_basic@force-connector-state
+kms_force_connector_basic@force-edid
+kms_force_connector_basic@force-load-detect
+kms_force_connector_basic@prune-stale-modes
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/msm-apq8096-fails.txt
new file mode 100644
index 000000000000..88a1fc0a3b0d
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-apq8096-fails.txt
@@ -0,0 +1,2 @@
+kms_3d,Fail
+kms_addfb_basic@addfb25-bad-modifier,Fail
diff --git a/drivers/gpu/drm/ci/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/msm-apq8096-flakes.txt
new file mode 100644
index 000000000000..b63329d06767
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-apq8096-flakes.txt
@@ -0,0 +1,4 @@
+kms_force_connector_basic@force-connector-state
+kms_force_connector_basic@force-edid
+kms_force_connector_basic@force-load-detect
+kms_force_connector_basic@prune-stale-modes
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/msm-apq8096-skips.txt
new file mode 100644
index 000000000000..cd49c8ce2059
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-apq8096-skips.txt
@@ -0,0 +1,2 @@
+# Whole machine hangs
+kms_cursor_legacy@all-pipes-torture-move
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-sc7180-fails.txt b/drivers/gpu/drm/ci/msm-sc7180-fails.txt
new file mode 100644
index 000000000000..0b159b6469c8
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sc7180-fails.txt
@@ -0,0 +1,22 @@
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions,Crash
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
+kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
+kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
+kms_plane_alpha_blend@pipe-B-alpha-7efc,Fail
+kms_plane_alpha_blend@pipe-B-alpha-basic,Fail
+kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
+kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
+kms_plane_alpha_blend@pipe-B-constant-alpha-mid,Fail
+kms_plane_alpha_blend@pipe-B-coverage-7efc,Fail
+kms_plane_alpha_blend@pipe-B-coverage-vs-premult-vs-constant,Fail
+kms_plane_multiple@atomic-pipe-A-tiling-none,Crash
+kms_rmfb@close-fd,Fail
+kms_rotation_crc@primary-rotation-180,Fail
+kms_universal_plane@disable-primary-vs-flip-pipe-B,Fail
+kms_universal_plane@disable-primary-vs-flip-pipe-b,Fail
diff --git a/drivers/gpu/drm/ci/msm-sc7180-flakes.txt b/drivers/gpu/drm/ci/msm-sc7180-flakes.txt
new file mode 100644
index 000000000000..6022edace190
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sc7180-flakes.txt
@@ -0,0 +1,14 @@
+# Test ends up reading CRC from frame before cursor update
+# sometimes.. tbd if this is a kernel CRC bug or a test
+# bug
+kms_cursor_crc@pipe-.*
+
+kms_cursor_edge_walk@pipe-A-64x64-bottom-edge
+kms_cursor_edge_walk@pipe-A-64x64-left-edge
+kms_cursor_edge_walk@pipe-A-64x64-right-edge
+kms_cursor_edge_walk@pipe-A-64x64-top-edge
+kms_cursor_edge_walk@pipe-B-64x64-bottom-edge
+kms_cursor_edge_walk@pipe-B-64x64-left-edge
+kms_cursor_edge_walk@pipe-B-64x64-right-edge
+kms_cursor_edge_walk@pipe-B-64x64-top-edge
+kms_plane_multiple@atomic-pipe-A-tiling-none
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/msm-sc7180-skips.txt
new file mode 100644
index 000000000000..40916ddff81f
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sc7180-skips.txt
@@ -0,0 +1,18 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Test incorrectly assumes that CTM support implies gamma/degamma
+# LUT support.  None of the subtests handle the case of only having
+# CTM support
+kms_color.*
+
+# 4k@60 is not supported on this hw, but driver doesn't handle it
+# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
+kms_bw@linear-tiling-.*-displays-3840x2160p
+
+# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
+kms_bw@linear-tiling-2.*
+kms_bw@linear-tiling-3.*
+kms_bw@linear-tiling-4.*
+kms_bw@linear-tiling-5.*
+kms_bw@linear-tiling-6.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/msm-sdm845-fails.txt
new file mode 100644
index 000000000000..8133927a44df
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sdm845-fails.txt
@@ -0,0 +1,44 @@
+kms_color@pipe-A-ctm-0-25,Fail
+kms_color@pipe-A-ctm-0-5,Fail
+kms_color@pipe-A-ctm-0-75,Fail
+kms_color@pipe-A-ctm-blue-to-red,Fail
+kms_color@pipe-A-ctm-green-to-red,Fail
+kms_color@pipe-A-ctm-max,Fail
+kms_color@pipe-A-ctm-negative,Fail
+kms_color@pipe-A-ctm-red-to-blue,Fail
+kms_color@pipe-A-legacy-gamma,Fail
+kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-after-cursor-legacy,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_cursor_legacy@short-flip-after-cursor-atomic-transitions,Fail
+kms_cursor_legacy@short-flip-after-cursor-toggle,Fail
+kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Fail
+kms_cursor_legacy@short-flip-before-cursor-toggle,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
+kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
+kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
+kms_plane_cursor@pipe-A-overlay-size-128,Fail
+kms_plane_cursor@pipe-A-overlay-size-256,Fail
+kms_plane_cursor@pipe-A-overlay-size-64,Fail
+kms_plane_cursor@pipe-A-viewport-size-128,Fail
+kms_plane_cursor@pipe-A-viewport-size-256,Fail
+kms_plane_cursor@pipe-A-viewport-size-64,Fail
+kms_plane_scaling@downscale-with-pixel-format-factor-0-25,Timeout
+kms_plane_scaling@downscale-with-pixel-format-factor-0-5,Timeout
+kms_plane_scaling@downscale-with-pixel-format-factor-0-75,Timeout
+kms_plane_scaling@invalid-num-scalers,Fail
+kms_plane_scaling@planes-downscale-factor-0-25,Fail
+kms_plane_scaling@scaler-with-clipping-clamping,Timeout
+kms_plane_scaling@scaler-with-pixel-format-unity-scaling,Timeout
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/msm-sdm845-flakes.txt
new file mode 100644
index 000000000000..da4406b74828
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sdm845-flakes.txt
@@ -0,0 +1,33 @@
+# Test ends up reading CRC from frame before cursor update
+# sometimes.. tbd if this is a kernel CRC bug or a test
+# bug
+kms_cursor_crc@pipe-A-cursor-alpha-opaque
+kms_cursor_crc@pipe-A-cursor-dpms
+kms_cursor_crc@pipe-A-cursor-size-change
+kms_cursor_legacy@flip-vs-cursor-toggle
+kms_cursor_legacy@pipe-A-forked-bo
+kms_cursor_legacy@pipe-A-forked-move
+kms_cursor_crc@pipe-A-cursor-32x10-offscreen
+kms_cursor_crc@pipe-A-cursor-32x10-onscreen
+kms_cursor_crc@pipe-A-cursor-32x10-random
+kms_cursor_crc@pipe-A-cursor-32x10-sliding
+kms_cursor_crc@pipe-A-cursor-32x32-offscreen
+kms_cursor_crc@pipe-A-cursor-32x32-onscreen
+kms_cursor_crc@pipe-A-cursor-32x32-random
+kms_cursor_crc@pipe-A-cursor-32x32-sliding
+kms_cursor_crc@pipe-A-cursor-64x21-offscreen
+kms_cursor_crc@pipe-A-cursor-64x21-onscreen
+kms_cursor_crc@pipe-A-cursor-64x21-random
+kms_cursor_crc@pipe-A-cursor-64x21-sliding
+kms_cursor_crc@pipe-A-cursor-64x64-offscreen
+kms_cursor_crc@pipe-A-cursor-64x64-onscreen
+kms_cursor_crc@pipe-A-cursor-64x64-random
+kms_cursor_crc@pipe-A-cursor-64x64-sliding
+kms_cursor_crc@pipe-A-cursor-dpms
+kms_cursor_crc@pipe-A-cursor-suspend
+kms_cursor_edge_walk@pipe-A-64x64-bottom-edge
+kms_cursor_edge_walk@pipe-A-64x64-left-edge
+kms_cursor_edge_walk@pipe-A-64x64-right-edge
+kms_cursor_edge_walk@pipe-A-64x64-top-edge
+
+kms_flip@dpms-vs-vblank-race-interruptible
diff --git a/drivers/gpu/drm/ci/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/msm-sdm845-skips.txt
new file mode 100644
index 000000000000..42675f1c6d76
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm-sdm845-skips.txt
@@ -0,0 +1,2 @@
+# Hangs machine
+kms_bw.*
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/rockchip-rk3288-fails.txt
new file mode 100644
index 000000000000..e2a264647a58
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3288-fails.txt
@@ -0,0 +1,75 @@
+kms_3d,Fail
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-random,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-random,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-random,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-random,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-alpha-opaque,Fail
+kms_cursor_crc@pipe-A-cursor-dpms,Fail
+kms_cursor_crc@pipe-A-cursor-size-change,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-random,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-random,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-64x21-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-64x21-random,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-random,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-alpha-opaque,Fail
+kms_cursor_crc@pipe-B-cursor-size-change,Fail
+kms_force_connector_basic@force-connector-state,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_force_connector_basic@force-load-detect,Fail
+kms_force_connector_basic@prune-stale-modes,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-A-frame-sequence,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-B-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc-pipe-A-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc-pipe-B-frame-sequence,Fail
+kms_plane_cursor@pipe-A-overlay-size-128,Fail
+kms_plane_cursor@pipe-A-overlay-size-256,Fail
+kms_plane_cursor@pipe-A-overlay-size-64,Fail
+kms_plane_cursor@pipe-A-primary-size-128,Fail
+kms_plane_cursor@pipe-A-primary-size-256,Fail
+kms_plane_cursor@pipe-A-primary-size-64,Fail
+kms_plane_cursor@pipe-A-viewport-size-128,Fail
+kms_plane_cursor@pipe-A-viewport-size-256,Fail
+kms_plane_cursor@pipe-A-viewport-size-64,Fail
+kms_plane_cursor@pipe-B-overlay-size-128,Fail
+kms_plane_cursor@pipe-B-overlay-size-256,Fail
+kms_plane_cursor@pipe-B-overlay-size-64,Fail
+kms_plane_cursor@pipe-B-primary-size-128,Fail
+kms_plane_cursor@pipe-B-primary-size-256,Fail
+kms_plane_cursor@pipe-B-primary-size-64,Fail
+kms_plane_cursor@pipe-B-viewport-size-128,Fail
+kms_plane_cursor@pipe-B-viewport-size-256,Fail
+kms_plane_cursor@pipe-B-viewport-size-64,Fail
+kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
+kms_plane_scaling@upscale-with-modifier-20x20,Fail
+kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
+kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
+kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_prime@basic-crc,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
+kms_rmfb@close-fd,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/rockchip-rk3288-flakes.txt
new file mode 100644
index 000000000000..447fb26cc344
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3288-flakes.txt
@@ -0,0 +1,5 @@
+kms_cursor_crc@pipe-B-cursor-dpms
+kms_cursor_edge_walk@pipe-A-64x64-right-edge
+kms_cursor_edge_walk@pipe-A-64x64-top-edge
+kms_cursor_edge_walk@pipe-B-64x64-right-edge
+kms_cursor_edge_walk@pipe-B-64x64-top-edge
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/rockchip-rk3288-skips.txt
new file mode 100644
index 000000000000..26f9a03fc074
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3288-skips.txt
@@ -0,0 +1,46 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
+
+# Started hanging the machine on Linux 5.19-rc2:
+#
+# [IGT] kms_plane_lowres: executing
+# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
+# [IGT] kms_plane_lowres: exiting, ret=77
+# Console: switching to colour frame buffer device 170x48
+# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
+# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
+# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
+# 8<--- cut here ---
+# Unable to handle kernel paging request at virtual address 7812078e
+# [7812078e] *pgd=00000000
+# Internal error: Oops: 5 [#1] SMP ARM
+# Modules linked in:
+# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
+# Hardware name: Rockchip (Device Tree)
+# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
+#  spin_dump from do_raw_spin_lock+0xa4/0xe8
+#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
+#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
+#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
+#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
+#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
+#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
+#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
+#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
+#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
+#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
+#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
+#  drm_client_dev_restore from drm_release+0xf4/0x114
+#  drm_release from __fput+0x74/0x240
+#  __fput from task_work_run+0x84/0xb4
+#  task_work_run from do_exit+0x34c/0xa20
+#  do_exit from do_group_exit+0x34/0x98
+#  do_group_exit from __wake_up_parent+0x0/0x18
+# Code: e595c008 12843d19 03e00000 03093168 (15940508) 
+# ---[ end trace 0000000000000000 ]---
+# note: kms_plane_lowre[482] exited with preempt_count 1
+# Fixing recursive fault but reboot is needed!
+kms_plane_lowres@pipe-F-tiling-y
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/rockchip-rk3399-fails.txt
new file mode 100644
index 000000000000..0f8afa7e2adc
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3399-fails.txt
@@ -0,0 +1,86 @@
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_color@pipe-A-legacy-gamma,Fail
+kms_color@pipe-B-legacy-gamma,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-offscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-random,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-rapid-movement,Fail
+kms_cursor_crc@pipe-A-cursor-32x10-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-offscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-random,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-rapid-movement,Fail
+kms_cursor_crc@pipe-A-cursor-32x32-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-random,Fail
+kms_cursor_crc@pipe-A-cursor-64x21-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-offscreen,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-onscreen,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-random,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-rapid-movement,Fail
+kms_cursor_crc@pipe-A-cursor-64x64-sliding,Fail
+kms_cursor_crc@pipe-A-cursor-alpha-opaque,Fail
+kms_cursor_crc@pipe-A-cursor-alpha-transparent,Fail
+kms_cursor_crc@pipe-A-cursor-dpms,Fail
+kms_cursor_crc@pipe-A-cursor-size-change,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-random,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-rapid-movement,Fail
+kms_cursor_crc@pipe-B-cursor-32x10-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-offscreen,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-random,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-rapid-movement,Fail
+kms_cursor_crc@pipe-B-cursor-32x32-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-64x21-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-64x21-random,Fail
+kms_cursor_crc@pipe-B-cursor-64x21-rapid-movement,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-offscreen,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-onscreen,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-random,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-rapid-movement,Fail
+kms_cursor_crc@pipe-B-cursor-64x64-sliding,Fail
+kms_cursor_crc@pipe-B-cursor-alpha-opaque,Fail
+kms_cursor_crc@pipe-B-cursor-dpms,Fail
+kms_cursor_crc@pipe-B-cursor-size-change,Fail
+kms_cursor_edge_walk@pipe-A-64x64-bottom-edge,Fail
+kms_cursor_edge_walk@pipe-A-64x64-left-edge,Fail
+kms_cursor_edge_walk@pipe-A-64x64-top-edge,Fail
+kms_cursor_edge_walk@pipe-B-64x64-bottom-edge,Fail
+kms_cursor_edge_walk@pipe-B-64x64-right-edge,Fail
+kms_cursor_edge_walk@pipe-B-64x64-top-edge,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-A,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-A-frame-sequence,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-B,Fail
+kms_pipe_crc_basic@nonblocking-crc-pipe-B-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc-pipe-A,Fail
+kms_pipe_crc_basic@read-crc-pipe-A-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc-pipe-B,Fail
+kms_pipe_crc_basic@read-crc-pipe-B-frame-sequence,Fail
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane_cursor@pipe-B-overlay-size-128,Fail
+kms_plane_cursor@pipe-B-overlay-size-256,Fail
+kms_plane_cursor@pipe-B-overlay-size-64,Fail
+kms_plane_cursor@pipe-B-primary-size-128,Fail
+kms_plane_cursor@pipe-B-primary-size-256,Fail
+kms_plane_cursor@pipe-B-primary-size-64,Fail
+kms_plane_cursor@pipe-B-viewport-size-128,Fail
+kms_plane_cursor@pipe-B-viewport-size-256,Fail
+kms_plane_cursor@pipe-B-viewport-size-64,Fail
+kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
+kms_prime@basic-crc,Fail
+kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-pipe-B-functional,Fail
+kms_vblank@pipe-A-query-forked,Fail
+kms_vblank@pipe-A-query-idle,Fail
+kms_vblank@pipe-A-wait-busy,Fail
+kms_vblank@pipe-A-wait-forked,Fail
+kms_vblank@pipe-A-wait-forked-busy,Fail
+kms_vblank@pipe-B-query-forked,Fail
+kms_vblank@pipe-B-query-idle,Fail
+kms_vblank@pipe-B-wait-busy,Fail
+kms_vblank@pipe-B-wait-forked,Fail
+kms_vblank@pipe-B-wait-forked-busy,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/rockchip-rk3399-flakes.txt
new file mode 100644
index 000000000000..b4c37a4315e4
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3399-flakes.txt
@@ -0,0 +1,25 @@
+kms_cursor_crc@pipe-A-cursor-64x21-offscreen
+kms_cursor_crc@pipe-A-cursor-64x21-rapid-movement
+kms_cursor_crc@pipe-B-cursor-32x10-offscreen
+kms_cursor_crc@pipe-B-cursor-32x10-rapid-movement
+kms_cursor_crc@pipe-B-cursor-32x32-offscreen
+kms_cursor_crc@pipe-B-cursor-32x32-rapid-movement
+kms_cursor_crc@pipe-B-cursor-64x64-offscreen
+kms_cursor_crc@pipe-B-cursor-64x64-rapid-movement
+kms_cursor_edge_walk@pipe-A-64x64-right-edge
+kms_cursor_edge_walk@pipe-B-64x64-left-edge
+kms_flip@flip-vs-expired-vblank
+kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-B
+kms_plane_multiple@atomic-pipe-A-tiling-none
+kms_plane@plane-position-hole
+kms_sequence@get-forked
+kms_sequence@get-forked-busy
+kms_setmode@basic
+kms_vblank@pipe-A-accuracy-idle
+kms_vblank@pipe-A-query-busy
+kms_vblank@pipe-A-query-forked-busy
+kms_vblank@pipe-A-wait-idle
+kms_vblank@pipe-B-accuracy-idle
+kms_vblank@pipe-B-query-busy
+kms_vblank@pipe-B-query-forked-busy
+kms_vblank@pipe-B-wait-idle
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/rockchip-rk3399-skips.txt
new file mode 100644
index 000000000000..10c3d81a919a
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip-rk3399-skips.txt
@@ -0,0 +1,5 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
diff --git a/drivers/gpu/drm/ci/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/virtio_gpu-none-fails.txt
new file mode 100644
index 000000000000..2178bdd064dd
--- /dev/null
+++ b/drivers/gpu/drm/ci/virtio_gpu-none-fails.txt
@@ -0,0 +1,38 @@
+kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_addfb_basic@bad-pitch-65536,Fail
+kms_addfb_basic@bo-too-small,Fail
+kms_addfb_basic@size-max,Fail
+kms_addfb_basic@too-high,Fail
+kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
+kms_plane_scaling@planes-upscale-20x20,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
+kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
+kms_plane_scaling@upscale-with-modifier-20x20,Fail
+kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
+kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
+kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_vblank@crtc-id,Fail
+kms_vblank@invalid,Fail
+kms_vblank@pipe-A-accuracy-idle,Fail
+kms_vblank@pipe-A-query-busy,Fail
+kms_vblank@pipe-A-query-forked,Fail
+kms_vblank@pipe-A-query-forked-busy,Fail
+kms_vblank@pipe-A-query-idle,Fail
+kms_vblank@pipe-A-ts-continuation-idle,Fail
+kms_vblank@pipe-A-ts-continuation-modeset,Fail
+kms_vblank@pipe-A-ts-continuation-suspend,Fail
+kms_vblank@pipe-A-wait-busy,Fail
+kms_vblank@pipe-A-wait-forked,Fail
+kms_vblank@pipe-A-wait-forked-busy,Fail
+kms_vblank@pipe-A-wait-idle,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/virtio_gpu-none-flakes.txt b/drivers/gpu/drm/ci/virtio_gpu-none-flakes.txt
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/gpu/drm/ci/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/virtio_gpu-none-skips.txt
new file mode 100644
index 000000000000..78be18174012
--- /dev/null
+++ b/drivers/gpu/drm/ci/virtio_gpu-none-skips.txt
@@ -0,0 +1,6 @@
+# Hits a "refcount_t: underflow; use-after-free" in virtio_gpu_fence_event_process
+# When run in a particular order with other tests
+kms_cursor_legacy.*
+
+# Job just hangs without any output
+kms_flip@flip-vs-suspend.*
\ No newline at end of file
-- 
2.31.1

